import { React, Component } from "react";
import "bootstrap/dist/css/bootstrap.css";

class MainPage extends Component{
    constructor(props) {
        super(props);
        this.state = {
            data: []
        }
    }
    async getData() {
        const response = await fetch("http://localhost:8081/react_and_ajax_webapp_war/data");
        const res = await response.json();
        console.log(res);
        this.setState({
            data: res.data
        })
    }
    componentDidMount() {
        this.getData();
    }


    render(){
        return(
                    <div>

                            <div style={{background: "seagreen", color: "white" , margin: "10px" , borderRadius: "20px", padding: "20px"}}>
                                <center><h2>Insert, Update and Delete<br/><br/>(Assignment 5)</h2></center>
                            </div>

                        <div style={{padding: "10px"}} >
                            <table className="table bordered" style={{border: "2px solid royalblue"}}>
                                <tr>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Number</th>
                                </tr>
                                {this.state.data.map((item)=> <tr><td>{item.name}</td> <td>{item.address}</td><td>{item.number}</td> </tr> )}

                            </table>

                            <form action="http://localhost:8081/react_and_ajax_webapp_war/InsertPage.jsp" method={"post"} >
                                <button className="btn btn-primary">Insert</button>
                            </form>
                            <br/>

                            <form action="http://localhost:8081/react_and_ajax_webapp_war/UpdatePage.jsp" method={"post"} >
                                <button className="btn btn-warning">Update</button>
                            </form>
                            <br/>

                            <form action="http://localhost:8081/react_and_ajax_webapp_war/DeletePage.jsp" method={"post"} >
                                <button className="btn btn-danger">Delete</button>
                            </form>
                            <br/>

                            <br/>
                        </div>
                    </div>
        )
    };
};


export default MainPage;