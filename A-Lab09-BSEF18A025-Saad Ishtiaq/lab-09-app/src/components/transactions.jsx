import { React, Component } from "react";

class Transactions extends Component
{
  state={
      text:"",
      amount:0,
      transList:[],
      balance:0,
      expense:0,
      income:0,
      myId:1,
  }
  render(){
      return(    
        <div style={{marginLeft:500, marginRight:500}}>
            <div style={{textAlign: "center"}}>
                <h1>Expense Tracker</h1>
                <h3 >Balance : $ {this.state.balance}</h3>

            </div>
            <br/>

            <div style={{display:"flex", borderRadius:5, backgroundColor:"lightseagreen", padding:20, color:"white", justifyContent: "center"}}>
                <div style={{paddingRight:20}}>
                    Income : $ {this.state.income}
                </div> 
                
                <div style={{borderLeft:"2px solid white" , paddingLeft:20}}>
                    Expense: $ {this.state.expense}
                </div>               
            </div>
            
            <h3>Transaction History</h3>
            <hr/>

            <div style={{overflow: "auto", height:80}}>
                {this.state.transList.map( k => {
                    if(k.amount>0)
                    {
                        return (
                        <div className=""  style={{border:"2px solid green"}}>
                        <span >{k.text}</span>
                        <span style={{float:"right"}}>${k.amount}<span style={{backgroundColor:"green",color:"white"}} onClick={()=>this.removeItem(k.id)}>X</span></span><br></br>
                        </div>
                        )
                    }
                    else
                    {
                        return (
                            <div className=""  style={{border:"2px solid red"}}>
                            <span >{k.text}</span>
                            <span style={{float:"right"}}>${k.amount}<span style={{backgroundColor:"red",color:"white"}} onClick={()=>this.removeItem(k.id)}>X</span></span><br></br>
                            </div>
                            )

                    }

                })}
            </div>


            <h3>Add Transaction</h3>
            <div>
                <label><b> Description : </b></label>
                <div  className="form-group">
                    <input id="textInput" type="text" placeholder="Enter Description" className="form-control" onChange={this.addText }></input>
                </div>
                <label><b> Amount : </b></label>
                <div  className="form-group">
                    <input id="numberInput" type="number" placeholder="-ive -> expense, +ive -> income" className="form-control" onChange={this.addNumber }></input>
                </div>
                <button class="btn btn-outline-primary" style={{marginLeft:150}} onClick={this.addTransactions}> Add</button>
            </div>
        </div>
      );
  };
  addText=(event)=>
  {
    this.setState({text :event.target.value});
  }
  addNumber=(event)=>
  {
    this.setState({amount :parseFloat(event.target.value)});
      
  }
  addTransactions=(event)=>
  {
      let temp={};
      temp["id"]=this.state.myId;
      this.setState({myId: this.state.myId+1});
      temp["text"]=this.state.text;
      temp["amount"]=this.state.amount;
      if(this.state.text === "")
        {
            alert("Error! Enter a valid description!");
            return;
        }
        if(this.state.amount === 0)
        {
            alert("Error! Enter a valid amount!");
            return;
        }
      this.state.transList.unshift(temp);
      document.getElementById("textInput").value="";
      document.getElementById("numberInput").value="-ive -> expense, +ive -> income";

      if(this.state.amount>0)
      {
          this.setState({balance:this.state.balance+this.state.amount});
          this.setState({income:this.state.income+this.state.amount});
      }
      else
      {
        this.setState({balance:this.state.balance+this.state.amount});
        this.setState({expense:this.state.expense-this.state.amount});
      }

  }
  removeItem=(value)=>
  {
    this.setState({
        transList:this.state.transList.filter(listkey=>
            {
                if(value==listkey.id)
                {
                    if(listkey.amount>0)
                    {
                        this.setState({balance:this.state.balance-listkey.amount});
                        this.setState({income:this.state.income-listkey.amount});
                    }
                    else{
                        this.setState({balance:this.state.balance-listkey.amount});
                        this.setState({expense:this.state.expense+listkey.amount});
                    }
                    return false;
                }
                else
                {
                    return true;
                }
            })
    })
  }
}
  

 




export default Transactions;