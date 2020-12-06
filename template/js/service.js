
    function emplyees(id_service)
    {
        window.open(
            "./index.html?id="+id_service,
  '_blank' 
);
    }
    function RechercheByParcours()
    {
      
  var x = document.getElementById("selectParcours").value;
  localStorage.setItem("selectedParcours",x);
  if (x=="")
{setData(csv_data,false);

return;}
            dataForm = csv_data[0];
      
          new_data=dataForm.filter(function(d){return d["account:voc.tllInSite"][0]["display_title"] == x;});
          
            setData(new_data,true);

    }
    function displaySpinners()
    {
        document.getElementById("spinner1").style.display = "block";
        document.getElementById("spinner2").style.display = "block";
    }
    function hideSpinners()
    {
        document.getElementById("spinner1").style.display = "none";
        document.getElementById("spinner2").style.display = "none";
    }

var parcours;
var dataPhoto, dataForm, dataFacet=[], dataDoublons={};

   let url = 'https://jardindesconnaissances.univ-paris8.fr/THYP/20-21/g5/omk/api/items?resource_class_id[]=119';  
    var csv_data;          
    var q = d3.queue()
        .defer(d3.json, url)
        .awaitAll(function(error, results) {
            if (error) throw error;
            csv_data=results;
            console.log(csv_data);
            localStorage.clear();
            setData(results,false);
            
        });
    var divTT = d3.select("body").append("div")
        .attr("class", "tooltip")
        .style("opacity", 0);

    function setData(data,donneeFiltree){
        
        dataFacet=[];
        dataDoublons={};
 document.getElementById("etuCards").innerHTML="";
 document.getElementById("tabFacet").innerHTML="";
      if(donneeFiltree==true){ dataForm = data;}
      else { dataForm = data[0];
      parcours=dataFacet[0];}
      console.log(dataForm);
            let dataEtu = []; 
      
            dataForm.forEach(function(d, j){
                console.log("d = "+d["account:voc.tllInSite"][0]["display_title"]);
                d.reponses = {'poste':[]};

                    let quest = "Sites";

                    let prop = d["account:voc.tllInSite"][0]["display_title"];
                    let v = 'poste';

                    if(quest){
                        if(dataDoublons[quest] === undefined){
                            dataDoublons[quest]=dataFacet.length; 
                            dataFacet.push({'label':quest,'values':[]});
                          
                        }
                    
                      let rep = prop ? prop : '';
                        let kRep = quest+'_'+rep;
                        if(dataDoublons[kRep] === undefined){
                            dataDoublons[kRep]=dataFacet[dataDoublons[quest]]['values'].length;
                            dataFacet[dataDoublons[quest]]['values'].push({
                                'prop':rep
                                ,'importance': 0
                                ,'expression':v
                                ,'ids':[]
                            });
                        }                        
                        dataFacet[dataDoublons[quest]]['values'][dataDoublons[kRep]]['ids'].push(j);
                        dataFacet[dataDoublons[quest]]['values'][dataDoublons[kRep]]['importance'] +=  1;
                        
                    }

                        d.reponses.poste.push({'prop':prop,'importance':1,'expression':v,'id':j});

            });	
            hideSpinners();
            let html = '<div class="container"><div class="row">';
            html += '<div id="tabFacetContent__Col1" class="col-sm" style="padding-right:0px;padding-left:0px;"></div>';
          html += '</div></div>';

            var arrFacet = d3.select("#tabFacet")
                .selectAll("div")
                .data(dataFacet)
                .enter().append("div")
                .attr('class',"nav-item")
                .attr('role',"presentation")
                .append("a")
                .attr('class',function(d,i){
                    return i==0 ? "nav-link active" : "nav-link"
                })
                .attr('id',function(d,i){
                    return "tabFacet"+i
                })

                .text(d => d.label)
                .html(function(d, i) { return html.replace(/__/gi, "_"+i+"_");});	
                arrFacet.append('div').attr('id',function(d,i){
                    return "tabFacetContentDiag"+i
                })
                .text((d,i) => {
                    drawGraphReponse("#tabFacetContent_"+i+"_Col1", d.label, d.values, 100);
                });			

            var cards = d3.select('#etuCards').selectAll(".col-sm-4 mb-12").data(dataForm).enter()
                .append('div').attr('class','col-sm-12 mb-12 ').style('margin-bottom','10px')
                .append("div").attr('class','card shadow  mb-5 bg-white rounded')
                .style('cursor','pointer');
            var cardBody = cards.append('div').attr('class','card-body');
            cardBody.append('h4').attr('class','card-title')	  			
                        .text(function(d) { 
                          
                            return d["dcterms:title"][0]["@value"].toLowerCase(); 
                                });
            cardBody.append('p').text(function(d) { 
                
                            return d["dcterms:description"][0]["@value"]; 
                                });
   
            cardBody.append('button').attr('class','btn btn-outline-danger')
            .attr('onClick',function(d) { 
                          
                          return 'emplyees('+d["o:id"]+ ')';
                              })
            .style('float','right')
            .text("Liste des employés");
            
                    if(donneeFiltree==false)
    {
      parcours=dataFacet[0];
      
      }
                  var selectParcours=  document.getElementById("selectParcours");
                
                  selectParcours.innerHTML='<option value=""></option>';
                var selectedParcours=localStorage.getItem("selectedParcours");

for (let index = 0; index < parcours.values.length; index++) {
   

  var opt = document.createElement('option');
    opt.value = parcours.values[index].prop;
    opt.innerHTML = parcours.values[index].prop;
  
    selectParcours.appendChild(opt);
    if(selectedParcours==parcours.values[index].prop){selectParcours.selectedIndex=index+1; }
}

}


