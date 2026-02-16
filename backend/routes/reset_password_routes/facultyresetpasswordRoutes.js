const express = require("express");
const bcrypt = require("bcrypt");
const nodemailer = require("nodemailer");
const { db3 } = require("../database/database"); // change if needed

const router = express.Router();

/* ============================================================
   🔹 EMPLOYEE: GET INFO (Search by Employee ID, Name, Email)
============================================================ */
router.post("/superadmin-get-employee", async (req, res) => {
  const { search } = req.body;

  try {
    const searchTerm = `%${search}%`;

    const [rows] = await db3.query(
      `
      SELECT 
        employee_id,
        fname,
        mname,
        lname,
        email,
        status
      FROM prof_table
      WHERE 
        employee_id LIKE ? OR
        fname LIKE ? OR
        mname LIKE ? OR
        lname LIKE ? OR
        email LIKE ?
      LIMIT 1
      `,
      [searchTerm, searchTerm, searchTerm, searchTerm, searchTerm]
    );

    if (!rows.length) {
      return res.status(404).json({ message: "Employee not found" });
    }

    const emp = rows[0];

    const fullName = [emp.fname, emp.mname, emp.lname]
      .filter(Boolean)
      .join(" ");

    res.json({
      employee_id: emp.employee_id,
      email: emp.email,
      fullName,
      status: emp.status ?? 0,
    });

  } catch (err) {
    console.error("Get employee error:", err);
    res.status(500).json({ message: "Internal server error" });
  }
});


/* ============================================================
   🔹 EMPLOYEE: RESET PASSWORD
============================================================ */
router.post("/superadmin-reset-employee", async (req, res) => {
  const { email } = req.body;

  try {
    // Check if employee exists
    const [rows] = await db3.query(
      `SELECT email FROM prof_table WHERE email = ?`,
      [email]
    );

    if (!rows.length) {
      return res.status(404).json({ message: "Email not found." });
    }

    // Generate random password (8 uppercase letters)
    const newPassword = Array.from({ length: 8 }, () =>
      String.fromCharCode(Math.floor(Math.random() * 26) + 65)
    ).join("");

    const hashedPassword = await bcrypt.hash(newPassword, 10);

    // Update password
    await db3.query(
      `UPDATE prof_table SET password = ? WHERE email = ?`,
      [hashedPassword, email]
    );

    // Get school short term
    const [settings] = await db3.query(
      "SELECT short_term FROM company_settings WHERE id = 1"
    );

    const shortTerm =
      settings.length > 0 && settings[0].short_term
        ? settings[0].short_term
        : "Institution";

    // Email transport
    const transporter = nodemailer.createTransport({
      service: "gmail",
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS,
      },
    });

    await transporter.sendMail({
      from: `"${shortTerm} - Information System" <${process.env.EMAIL_USER}>`,
      to: email,
      subject: "Employee Password Reset",
      text: `Your new temporary password is: ${newPassword}\n\nPlease change it after logging in.`,
    });

    res.json({
      success: true,
      message: "Password reset successfully. Email sent.",
    });

  } catch (err) {
    console.error("Reset employee error:", err);
    res.status(500).json({ message: "Internal server error" });
  }
});


/* ============================================================
   🔹 EMPLOYEE: UPDATE STATUS (0 = inactive, 1 = active)
============================================================ */
router.post("/superadmin-update-status-employee", async (req, res) => {
  const { email, status } = req.body;

  try {
    const [result] = await db3.query(
      `UPDATE prof_table SET status = ? WHERE email = ?`,
      [status, email]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Employee not found" });
    }

    res.json({
      message: "Employee status updated successfully",
      status,
    });

  } catch (err) {
    console.error("Update employee status error:", err);
    res.status(500).json({ message: "Internal server error" });
  }
});

router.get("/superadmin-get-all-faculty", async (req, res) => {
  try {
    const [rows] = await db3.query(`
      SELECT 
        employee_id, 
        CONCAT(fname,' ',IFNULL(mname,''),' ',lname) AS fullName,
        email,
        status
      FROM prof_table
      ORDER BY fname ASC
    `);

    res.json(rows);
  } catch (err) {
    console.error("Faculty fetch error:", err);
    res.status(500).json({ message: "Server error" });
  }
});

router.post("/superadmin-get-faculty", async (req, res) => {
  const { search } = req.body;
  const term = `%${search}%`;

  const [rows] = await db3.query(`
    SELECT 
      employee_id,
      CONCAT(fname,' ',IFNULL(mname,''),' ',lname) AS fullName,
      email,
      status
    FROM prof_table
    WHERE 
      employee_id LIKE ? OR
      fname LIKE ? OR
      lname LIKE ? OR
      email LIKE ?
    LIMIT 1
  `, [term, term, term, term]);

  if (!rows.length) return res.status(404).json({ message: "Not found" });

  res.json(rows[0]);
});



module.exports = router;
