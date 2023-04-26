import {
  createBrowserRouter,
  Outlet,
  RouterProvider,
} from "react-router-dom";
import Home from "./pages/Home"
import Login from "./pages/Login"
import Info from "./pages/Info"
import Details from "./pages/Details"
import Add from "./pages/Add"
import Navbar from "./components/Navbar"
import { createTheme, ThemeProvider } from '@mui/material';

const theme = createTheme({
  typography: {
    fontFamily: [
      'Ubuntu:300'
    ].join(','),
  },});

const Layout = () => {
  return (
    <> 
      <Navbar/>
      <Outlet/>
  
    </>
  );
}

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: "/",
        element: <Home/>
      },
      {
        path: "/login",
        element: <Login/>,
      },
      {
        path: "/info",
        element: <Info/>,
      },
      {
        path: 'details/:id',
        element: <Details />,
        exact: true,
      },
      {
        path: "/add",
        element: <Add/>,
      },
    ]
  },
  {
    path: "/home",
    element: <Home/>,
  },
  {
    path: "/login",
    element: <Login/>,
  },
  
]);

function App() {
  return (
    <ThemeProvider theme={theme}>
    <div className="app">
      <div className="container">
        <RouterProvider router={router}/>
      </div>
    </div>
    </ThemeProvider>
  );
}



export default App;

