const express = require("express");
const { db3 } = require("../database/database");

const router = express.Router();

// ---------------------------- CREATE PROGRAM ----------------------------------
router.post("/program", async (req, res) => {
  const { name, code, major, components } = req.body;

  if (!["0", "1"].includes(components)) {
    return res.status(400).json({
      message: "Invalid campus value",
    });
  }

  try {
    await db3.query(
      `INSERT INTO program_table 
       (program_description, program_code, major, components)
       VALUES (?, ?, ?, ?)`,
      [name, code, major, components]
    );

    res.status(200).json({ message: "Program created successfully" });
  } catch (err) {
    console.error("Error creating program:", err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// -------------------- GET PROGRAMS --------------------
router.get("/get_program", async (req, res) => {
  try {
    const [result] = await db3.query("SELECT * FROM program_table");
    res.status(200).send(result);
  } catch (err) {
    console.error("Error fetching programs:", err);
    res.status(500).send({ message: "Internal Server Error" });
  }
});

// -------------------- UPDATE PROGRAM --------------------
router.put("/program/:id", async (req, res) => {
  const { id } = req.params;
  const { name, code, major, components } = req.body;

  if (!["0", "1"].includes(components)) {
    return res.status(400).json({
      message: "Invalid campus value",
    });
  }

  try {
    const [result] = await db3.query(
      `UPDATE program_table
       SET program_description = ?, 
           program_code = ?, 
           major = ?, 
           components = ?
       WHERE program_id = ?`,
      [name, code, major, components, id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Program not found" });
    }

    res.json({ message: "Program updated successfully" });
  } catch (err) {
    console.error("Error updating program:", err);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// -------------------- DELETE PROGRAM --------------------
router.delete("/program/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const [result] = await db3.query(
      "DELETE FROM program_table WHERE program_id = ?",
      [id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: "Program not found" });
    }

    res.status(200).send({ message: "Program deleted successfully" });
  } catch (err) {
    console.error("Error deleting program:", err);
    res.status(500).send({ message: "Internal Server Error" });
  }
});

// -------------------- SUPERADMIN UPDATE PROGRAM --------------------
router.put("/update_program/:id", async (req, res) => {
  const { id } = req.params;
  const { name, code, major, components } = req.body;

  if (!["0", "1"].includes(components)) {
    return res.status(400).json({
      message: "Invalid campus value",
    });
  }

  try {
    const [result] = await db3.query(
      `UPDATE program_table 
       SET program_description = ?, 
           program_code = ?, 
           major = ?, 
           components = ?
       WHERE program_id = ?`,
      [name, code, major, components, id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: "Program not found" });
    }

    res.status(200).send({ message: "Program updated successfully" });
  } catch (err) {
    console.error("Error updating program:", err);
    res.status(500).send({ message: "Internal Server Error" });
  }
});

// -------------------- SUPERADMIN DELETE PROGRAM --------------------
router.delete("/delete_program/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const [result] = await db3.query(
      "DELETE FROM program_table WHERE program_id = ?",
      [id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: "Program not found" });
    }

    res.status(200).send({ message: "Program deleted successfully" });
  } catch (err) {
    console.error("Error deleting program:", err);
    res.status(500).send({ message: "Internal Server Error" });
  }
});

module.exports = router;
