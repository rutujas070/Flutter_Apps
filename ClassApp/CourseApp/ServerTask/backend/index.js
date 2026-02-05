const exprees=require("express");

const app=exprees();

app.use(exprees.json())
app.use(exprees.urlencoded({
    extended:true
}))


//Post
const personData=[];
app.post("/api/add_person",(req,res)=>{
    console.log("Result",req.body);
    const pData={
        'id':personData.length+1,
        'pName':req.body.pName,
        'pPhone':req.body.pPhone,
        'pAge':req.body.pAge
    }
    personData.push(pData);
    console.log("Final Result: ",pData)
    res.status(200).send({
        "Status_Code":200,
        "Message":"Person Data is Added Successfully",
        "Person":pData

})
})


//Get
app.get("/api/get_person",(req,res)=>{
    if(personData.length>0){
        res.status(200).send({
            "Status_Code":200,
            "Person":personData
        })
    }else{
        res.status(200).send({
            "Status_Code":200,
            "Person":[]
        })
    }
})

port=3000;
app.listen(port,()=>{
    console.log(`Successfully Connected to ${port}`)
})