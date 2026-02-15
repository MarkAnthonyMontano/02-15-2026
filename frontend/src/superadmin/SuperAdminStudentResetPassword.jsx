import React, { useState, useEffect, useContext } from "react";
import { SettingsContext } from "../App";
import axios from "axios";

import {
  Box,
  Button,
  TextField,
  Typography,
  Paper,
  MenuItem,
  FormControl,
  Select
} from "@mui/material";
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from "@mui/material";
import { Snackbar, Alert } from "@mui/material";

import SearchIcon from "@mui/icons-material/Search";

import Unauthorized from "../components/Unauthorized";
import LoadingOverlay from "../components/LoadingOverlay";

import API_BASE_URL from "../apiConfig";


const SuperAdminStudentResetPassword = () => {

  /* =====================================
     SETTINGS
  ===================================== */
  const settings = useContext(SettingsContext);

  const [titleColor, setTitleColor] = useState("#000");
  const [borderColor, setBorderColor] = useState("#000");
  const [mainButtonColor, setMainButtonColor] = useState("#1976d2");


  useEffect(() => {
    if (!settings) return;

    if (settings.title_color) setTitleColor(settings.title_color);
    if (settings.border_color) setBorderColor(settings.border_color);
    if (settings.main_button_color) setMainButtonColor(settings.main_button_color);

  }, [settings]);


  /* =====================================
     AUTH
  ===================================== */
  const [hasAccess, setHasAccess] = useState(null);
  const [loading, setLoading] = useState(false);

  const pageId = 91;
  const [employeeID, setEmployeeID] = useState("");


  useEffect(() => {

    const email = localStorage.getItem("email");
    const role = localStorage.getItem("role");
    const empID = localStorage.getItem("employee_id");

    if (!email || role !== "registrar") {
      window.location.href = "/login";
      return;
    }

    setEmployeeID(empID);
    checkAccess(empID);

  }, []);


  const checkAccess = async (id) => {
    try {
      const res = await axios.get(
        `${API_BASE_URL}/api/page_access/${id}/${pageId}`
      );

      setHasAccess(res.data?.page_privilege === 1);

    } catch {
      setHasAccess(false);
    }
  };


  /* =====================================
     SNACKBAR
  ===================================== */
  const [snackbar, setSnackbar] = useState({
    open: false,
    message: "",
    severity: "success",
  });


  /* =====================================
     SEARCH
  ===================================== */
  const [searchQuery, setSearchQuery] = useState("");
  const [userInfo, setUserInfo] = useState(null);
  const [searchError, setSearchError] = useState("");


  /* =====================================
     FETCH SINGLE STUDENT
  ===================================== */
  useEffect(() => {

    if (!searchQuery) {
      setUserInfo(null);
      setSearchError("");
      return;
    }

    const fetchStudent = async () => {

      try {
        const res = await axios.post(
          `${API_BASE_URL}/superadmin-get-student`,
          { search: searchQuery }
        );

        setUserInfo(res.data);

      } catch (err) {

        setSearchError(
          err.response?.data?.message || "Student not found"
        );

        setUserInfo(null);
      }
    };

    const delay = setTimeout(fetchStudent, 600);

    return () => clearTimeout(delay);

  }, [searchQuery]);


  /* =====================================
     FETCH ALL STUDENTS
  ===================================== */
  const [students, setStudents] = useState([]);

  useEffect(() => {

    const fetchStudents = async () => {

      setLoading(true);

      try {
        const res = await axios.get(
          `${API_BASE_URL}/superadmin-get-all-students`
        );

        setStudents(res.data);

      } catch (err) {
        console.error("Fetch students error", err);
      }

      setLoading(false);
    };

    fetchStudents();

  }, []);


  /* =====================================
     RESET PASSWORD
  ===================================== */
  const handleReset = async () => {

    if (!userInfo) return;

    setLoading(true);

    try {

      const res = await axios.post(
        `${API_BASE_URL}/superadmin-reset-student`,
        { search: userInfo.email }
      );

      setSnackbar({
        open: true,
        message: res.data.message,
        severity: "success",
      });

    } catch (err) {

      setSnackbar({
        open: true,
        message: err.response?.data?.message || "Reset failed",
        severity: "error",
      });

    } finally {
      setLoading(false);
    }
  };


  /* =====================================
     UPDATE STATUS
  ===================================== */
  const handleStatusChange = async (e) => {

    const newStatus = Number(e.target.value);

    setUserInfo(prev => ({
      ...prev,
      status: newStatus
    }));

    try {

      await axios.post(
        `${API_BASE_URL}/superadmin-update-status-student`,
        {
          email: userInfo.email,
          status: newStatus,
        }
      );

    } catch {
      console.error("Status update failed");
    }
  };


  /* =====================================
     PAGINATION
  ===================================== */
  const [currentPage, setCurrentPage] = useState(1);

  const rowsPerPage = 25;

  const totalPages = Math.ceil(students.length / rowsPerPage);

  const indexOfLast = currentPage * rowsPerPage;
  const indexOfFirst = indexOfLast - rowsPerPage;

  const currentRows =
    students.slice(indexOfFirst, indexOfLast);


  /* =====================================
     CLICK NAME
  ===================================== */
  const handleNameClick = (student) => {

    setSearchQuery(student.email);

    window.scrollTo({
      top: document.body.scrollHeight,
      behavior: "smooth",
    });
  };

  const headerCellStyle = {
    color: "white",
    textAlign: "center",
    fontSize: "12px",
    border: `2px solid ${borderColor}`,
  };

  const paginationButtonStyle = {
    minWidth: 70,
    color: "white",
    borderColor: "white",
    backgroundColor: "transparent",
    "&:hover": {
      borderColor: "white",
      backgroundColor: "rgba(255,255,255,0.1)",
    },
    "&.Mui-disabled": {
      color: "white",
      borderColor: "white",
      backgroundColor: "transparent",
      opacity: 1,
    },
  };

  const paginationSelectStyle = {
    fontSize: "12px",
    height: 36,
    color: "white",
    border: "1px solid white",
    backgroundColor: "transparent",
    ".MuiOutlinedInput-notchedOutline": {
      borderColor: "white",
    },
    "& svg": {
      color: "white",
    },
  };


  /* =====================================
     DATE FORMAT
  ===================================== */
  const formatDate = (date) => {

    if (!date) return "";

    return new Date(date).toLocaleDateString(
      "en-US",
      { year: "numeric", month: "long", day: "numeric" }
    );
  };


  /* =====================================
     GUARDS
  ===================================== */
  if (loading || hasAccess === null) {
    return <LoadingOverlay open={loading} message="Loading..." />;
  }

  if (!hasAccess) {
    return <Unauthorized />;
  }


  /* =====================================
     STYLES
  ===================================== */
  const headerStyle = {
    textAlign: "center",
    fontSize: "12px",
    border: `2px solid ${borderColor}`,
  };


  /* =====================================
     RENDER
  ===================================== */
  return (
    <Box sx={{ p: 2 }}>

      {/* HEADER */}
      <Box
        display="flex"
        justifyContent="space-between"
        mb={2}
        flexWrap="wrap"
      >
        <Typography
          variant="h4"
          fontWeight="bold"
          color={titleColor}
        >
          STUDENT RESET PASSWORD
        </Typography>

        <TextField
          size="small"
          placeholder="Search Student / Email / Name"
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          sx={{
            width: 450,
            backgroundColor: "#fff",
            borderRadius: 1,
            "& .MuiOutlinedInput-root": {
              borderRadius: "10px",
            },
          }}
          InputProps={{
            startAdornment: <SearchIcon sx={{ mr: 1, color: "gray" }} />,
          }}
        />
      </Box>


      {searchError &&
        <Typography color="error">{searchError}</Typography>
      }

      <hr />
      <br />
      {/* ================= TABLE ================= */}

      <TableContainer component={Paper}>

        <Table size="small">

          <TableHead>

            {/* PAGINATION BAR */}
            <TableRow>
              <TableCell
                colSpan={5}
                sx={{
                  border: `2px solid ${borderColor}`,
                  py: 0.5,
                  backgroundColor: settings?.header_color || "#1976d2",
                  color: "white",
                }}
              >
                <Box display="flex" justifyContent="space-between" alignItems="center">

                  {/* LEFT: TOTAL COUNT */}
                  <Typography fontSize="14px" fontWeight="bold" color="white">
                    Total Students: {students.length}
                  </Typography>

                  {/* RIGHT: PAGINATION CONTROLS */}
                  <Box display="flex" alignItems="center" gap={1}>

                    {/* FIRST */}
                    <Button
                      onClick={() => setCurrentPage(1)}
                      disabled={currentPage === 1}
                      variant="outlined"
                      size="small"
                      sx={paginationButtonStyle}
                    >
                      First
                    </Button>

                    {/* PREV */}
                    <Button
                      onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}
                      disabled={currentPage === 1}
                      variant="outlined"
                      size="small"
                      sx={paginationButtonStyle}
                    >
                      Prev
                    </Button>

                    {/* PAGE DROPDOWN */}
                    <FormControl size="small" sx={{ minWidth: 90 }}>
                      <Select
                        value={currentPage}
                        onChange={(e) => setCurrentPage(Number(e.target.value))}
                        sx={paginationSelectStyle}
                        MenuProps={{
                          PaperProps: { sx: { maxHeight: 200 } }
                        }}
                      >
                        {Array.from({ length: totalPages }, (_, i) => (
                          <MenuItem key={i + 1} value={i + 1}>
                            Page {i + 1}
                          </MenuItem>
                        ))}
                      </Select>
                    </FormControl>

                    <Typography fontSize="12px" color="white">
                      of {totalPages} page{totalPages > 1 ? "s" : ""}
                    </Typography>

                    {/* NEXT */}
                    <Button
                      onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}
                      disabled={currentPage === totalPages}
                      variant="outlined"
                      size="small"
                      sx={paginationButtonStyle}
                    >
                      Next
                    </Button>

                    {/* LAST */}
                    <Button
                      onClick={() => setCurrentPage(totalPages)}
                      disabled={currentPage === totalPages}
                      variant="outlined"
                      size="small"
                      sx={paginationButtonStyle}
                    >
                      Last
                    </Button>
                  </Box>
                </Box>
              </TableCell>
            </TableRow>

            {/* COLUMNS */}
            <TableRow 
            >
              <TableCell sx={{ ...headerStyle, backgroundColor: "white", color: "black"}}>#</TableCell>
              <TableCell sx={{ ...headerStyle, backgroundColor: "white", color: "black"}}>Student No.</TableCell>
              <TableCell sx={{ ...headerStyle, backgroundColor: "white", color: "black"}}>Full Name</TableCell>
              <TableCell sx={{ ...headerStyle, backgroundColor: "white", color: "black"}}>Birthday</TableCell>
              <TableCell sx={{ ...headerStyle, backgroundColor: "white", color: "black"}}>Email</TableCell>
            </TableRow>

          </TableHead>


          <TableBody>

            {currentRows.length === 0 ? (

              <TableRow>
                <TableCell colSpan={5} align="center">
                  No students found
                </TableCell>
              </TableRow>

            ) : (

              currentRows.map((s, i) => (

                <TableRow key={i}>

                  <TableCell align="center" sx={{ border: `1px solid ${borderColor}` }}>
                    {indexOfFirst + i + 1}
                  </TableCell>

                  <TableCell align="center" sx={{ border: `1px solid ${borderColor}` }}>
                    {s.student_number}
                  </TableCell>

                  <TableCell
                    align="left"
                    sx={{
                      border: `1px solid ${borderColor}`,
                      color: "#1976d2",
                      cursor: "pointer",
                      fontWeight: 500,
                      "&:hover": {
                        textDecoration: "underline",
                      },
                    }}
                  >
                    {s.fullName}
                  </TableCell>

                  <TableCell align="center" sx={{ border: `1px solid ${borderColor}` }}>
                    {formatDate(s.birthdate)}
                  </TableCell>

                  <TableCell align="center" sx={{ border: `1px solid ${borderColor}` }}>
                    {s.email}
                  </TableCell>

                </TableRow>
              ))
            )}

          </TableBody>

        </Table>

      </TableContainer>


      <TableContainer component={Paper} sx={{ width: '100%', border: `2px solid ${borderColor}`, }}>
        <Table>
          <TableHead sx={{ backgroundColor: settings?.header_color || "#1976d2", }}>
            <TableRow>
              <TableCell sx={{ color: 'white', textAlign: "Center" }}>Student Information</TableCell>
            </TableRow>
          </TableHead>
        </Table>
      </TableContainer>


      <Paper sx={{ p: 3, border: `2px solid ${borderColor}` }}>

        <Box
          display="grid"
          gridTemplateColumns="1fr 1fr"
          gap={2}
        >

          <TextField
            label="Student Number"
            value={userInfo?.student_number || ""}
            InputProps={{ readOnly: true }}
          />

          <TextField
            label="Email"
            value={userInfo?.email || ""}
            InputProps={{ readOnly: true }}
          />

          <TextField
            label="Full Name"
            value={userInfo?.fullName || ""}
            InputProps={{ readOnly: true }}
          />

          <TextField
            label="Birthdate"
            type="date"
            value={userInfo?.birthdate || ""}
            InputLabelProps={{ shrink: true }}
            InputProps={{ readOnly: true }}
          />

          <TextField
            select
            label="Status"
            value={userInfo?.status ?? ""}
            onChange={handleStatusChange}
          >
            <MenuItem value={1}>Active</MenuItem>
            <MenuItem value={0}>Inactive</MenuItem>
          </TextField>

        </Box>


        <Box mt={3}>

          <Button
            variant="contained"
            style={{
              backgroundColor: mainButtonColor,
              color: "white",
            }}
            disabled={!userInfo || loading}
            onClick={handleReset}
          >
            {loading ? "Processing..." : "Reset Password"}
          </Button>

        </Box>

      </Paper>


      {/* ================= SNACKBAR ================= */}

      <Snackbar
        open={snackbar.open}
        autoHideDuration={3000}
        anchorOrigin={{ vertical: "top", horizontal: "center" }}
        onClose={() =>
          setSnackbar(p => ({ ...p, open: false }))
        }
      >
        <Alert
          severity={snackbar.severity}
          sx={{ width: "100%" }}
          onClose={() =>
            setSnackbar(p => ({ ...p, open: false }))
          }
        >
          {snackbar.message}
        </Alert>
      </Snackbar>

    </Box>
  );
};

export default SuperAdminStudentResetPassword;
