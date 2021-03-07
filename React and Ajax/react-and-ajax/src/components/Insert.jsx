import { React, Component } from "react";
import "bootstrap/dist/css/bootstrap.css";


class Insert extends Component{

    render(){
        return(
            <div>

                <div style={{background: "058d9b", color: "white" , margin: "10px" , borderRadius: "20px", padding: "20px"}}>
                    <center><h2>Insert Form</h2></center>
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

                    <form action="http://localhost:8081/react_and_ajax_webapp_war/insert">
                        <button className="btn btn-primary">Insert</button>
                    </form>

                    <br/>

                    <br/>
                </div>
            </div>
        )
    };


}