import {
  createBrowserRouter,
  Outlet,
  RouterProvider,
} from "react-router-dom";
import Home from "./pages/Home"
import Login from "./pages/Login"
import Info from "./pages/Info"
import Details from "./pages/Details"
import Navbar from "./components/Navbar"


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
    <div className="app">
      <div className="container">
        <RouterProvider router={router}/>
      </div>
    </div>
  );
}



export default App;

