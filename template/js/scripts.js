
  centreInteret(); 
  var CentreInteretTab=[];
var urlwindow = new URL(window.location.href);
var id_service = urlwindow.searchParams.get("id");

    function RechercheByParcours()
    {
       document.getElementById("searchByName").value="";
  var x = document.getElementById("selectParcours").value;
  localStorage.setItem("selectedParcours",x);
  if (x=="")
{setData(csv_data,false);

return;}
            dataForm = csv_data[0];
      
          new_data=dataForm.filter(function(d){return d["account:voc.tllposte"][0]["@value"] == x;});
          
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
function RechercheByName()
{ displaySpinners();
    localStorage.clear();
var name=document.getElementById('searchByName').value;
if (name=="")
{setData(csv_data,false);

return;}
            dataForm = csv_data[0];
          new_data=dataForm.filter(function(d){return d["foaf:firstName"][0]["@value"].toLowerCase() == name.toLowerCase()||d["foaf:lastName"][0]["@value"].toLowerCase() == name.toLowerCase();});
         
            setData(new_data,true);
    
}
var parcours;
var dataPhoto, dataForm, dataFacet=[], dataDoublons={};
    
 
   let url ='https://jardindesconnaissances.univ-paris8.fr/THYP/20-21/g5/omk/api/items?resource_class_id[]=116';
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
     
            let dataEtu = []; 
            if(id_service!=null&&id_service!="")
        {
            dataForm = dataForm.filter(function(d){return d["account:voc.tllworkInService"][0]["value_resource_id"]==id_service;});
            d3.select('#service')
            .data(dataForm)
            .text(
                function(d){return d["account:voc.tllworkInService"][0]["display_title"]+" :";}
            
            );
        }

           
            dataForm.forEach(function(d, j){
                d.reponses = {'poste':[]};

                    let quest = "Postes";
                    let prop = d["account:voc.tllposte"][0]["@value"];
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
                .append('div').attr('class','col-sm-4 mb-12').style('margin-bottom','10px')
                .append("div").attr('class','card');
            cards.append("img")
                    .attr('id',function(d, i) {return 'imgCard'+i})
                    .attr('class','card-img-top')
                    .attr('src',function(d) { 
                        
                        return d["thumbnail_display_urls"]["large"];
                        });


            var cardBody = cards.append('div').attr('class','card-body');
            cardBody.append('button').attr('class','btn btn-danger btn-sm')
            .style('float','right')
            .style('margin-bottom','10px')
            .attr('onClick',function(d) { 
                          
                return 'detailsEmploye('+d["o:id"]+ ')';
                    })
            .text('Détails ')
            .append('i').attr('class','fa fa-plus-square');
           
            cardBody.append('h4').attr('class','card-title')	  			
                        .text(function(d) { 
                          
                            return d["foaf:lastName"][0]["@value"].toLowerCase()+' '+d["foaf:firstName"][0]["@value"]; 
                                });

                                cardBody.append('p').text(function(d) { 
                
                
                return d["dcterms:description"][0]["@value"]; 
                    });
        


            cardBody.append('h6').text(d => d['Dans quel parcours êtes vous inscris ?']);


          
            html = '<div class="container-fluid"><div class="row" style="text-align: center;">';
            html += '<div id="etudNum__Col1" class="col-12" style="padding-right:0px;padding-left:0px;"></div>';
           
            html += '</div></div>';
            cardBody.append('div').attr('class','card-text').attr('id',function(d, i) { return 'etudNum_'+i; })
                .html(function(d, i) { return html.replace(/__/gi, "_"+i+"_");});	  			
            cards.append('div').attr('class','card-footer')
                .append('small').attr('class','text-muted')
                .append('a').attr('href',function(d, i) {
          
            return 'mailto:'+d["foaf:mbox"][0]["@value"].toLowerCase(); 
                }  )
                
                .text(function(d, i) {
                        
                        var size = 120;
                        drawGraphReponse("#etudNum_"+i+"_Col1", 'Postes occupés', d.reponses.poste, size);
                       
                return d["foaf:mbox"][0]["@value"].toLowerCase(); 
                    });
                    
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


function drawGraphReponse(idE, titre, data, size){

	let donut = donutChart()
	    .width(size)
	    .height(size)
	    .cornerRadius(3) // sets how rounded the corners are on each slice
	    .padAngle(0.015) // effectively dictates the gap between slices
	    .variable('importance')
	    .category('prop')
	    .title(titre);
    let s = d3.select(idE)
        .datum(data) // bind data to the div
        .call(donut); // draw chart in div
 
}


function donutChart() {
    var width,
        height,
        margin = {top: 0, right: 0, bottom: 10, left: 0},
        colour = d3.scaleOrdinal(d3.schemeCategory20c), // colour scheme
        variable, // value in data that will dictate proportions on chart
        category, // compare data by
        padAngle, // effectively dictates the gap between slices
        floatFormat = d3.format('.4r'),
        cornerRadius, // sets how rounded the corners are on each slice
        percentFormat = d3.format(',.2%'),
        title;

    function chart(selection){
        selection.each(function(data) {
      var radius = Math.min(width, height) / 2;

            var pie = d3.pie()
                .value(function(d) { return floatFormat(d[variable]); })
                .sort(null);

            var arc = d3.arc()
                .outerRadius(radius * 0.8)
                .innerRadius(radius * 0.6)
                .cornerRadius(cornerRadius)
                .padAngle(padAngle);

            var outerArc = d3.arc()
                .outerRadius(radius * 0.9)
                .innerRadius(radius * 0.9);

            var wSvg = width + margin.left + margin.right, hSvg = height + margin.top + margin.bottom; 
            var svg = selection.append('svg')
                .attr('width', wSvg)
                .attr('height', hSvg)
              .append('g')
                .attr('transform', 'translate(' + wSvg / 2 + ',' + (hSvg-10) / 2 + ')');            	

            svg.append('g').attr('class', 'slices');
            svg.append('g').attr('class', 'labelName');
            svg.append('g').attr('class', 'lines');

            var path = svg.select('.slices')
                .datum(data).selectAll('path')
                .data(pie)
              .enter().append('path')
                .attr('fill', function(d) { 
                    d.couleur = colour(d.data[category])
                    return d.couleur; 
                })
                .attr('d', arc);


            //ajoute le titre
            svg.append('text')
                .html(title)            
                .attr('text-anchor', 'middle')
                .attr('y', hSvg/2);            	



            d3.selectAll('.labelName text, .slices path').call(toolTip);

            function midAngle(d) { return d.startAngle + (d.endAngle - d.startAngle) / 2; }

 
            function toolTip(selection) {


                selection.on('mouseenter', function (data) {
                	
              		
                        divTT.transition()
                            .duration(200)
                            .style("opacity", .9);
                        divTT.html(toolTipHTML(data))
                            .style('background', data.couleur)
                            .style("left", (d3.event.pageX) + "px")
                            .style("top", (d3.event.pageY - 28) + "px");


                });

             
                selection.on('mouseout', function (data) {
                    d3.selectAll('.toolCircle').remove();
              		                    
                        divTT.transition()
                            .duration(500)
                            .style("opacity", 0);
                                    });
            }


            function toolTipHTML(data) {

            		var tip = '<h6 class="card-title">'+data.data.prop+'</h6>'
            		tip += '<p class="card-text">'+data.data.expression+'</p>';

                return tip;
            }
            

        });
    }

    
    chart.width = function(value) {
        if (!arguments.length) return width;
        width = value;
        return chart;
    };

    chart.height = function(value) {
        if (!arguments.length) return height;
        height = value;
        return chart;
    };

    chart.margin = function(value) {
        if (!arguments.length) return margin;
        margin = value;
        return chart;
    };

    chart.radius = function(value) {
        if (!arguments.length) return radius;
        radius = value;
        return chart;
    };

    chart.padAngle = function(value) {
        if (!arguments.length) return padAngle;
        padAngle = value;
        return chart;
    };

    chart.cornerRadius = function(value) {
        if (!arguments.length) return cornerRadius;
        cornerRadius = value;
        return chart;
    };

    chart.colour = function(value) {
        if (!arguments.length) return colour;
        colour = value;
        return chart;
    };

    chart.variable = function(value) {
        if (!arguments.length) return variable;
        variable = value;
        return chart;
    };

    chart.category = function(value) {
        if (!arguments.length) return category;
        category = value;
        return chart;
    };

    chart.title = function(value) {
        if (!arguments.length) return title;
        title = value;
        return chart;
    };
    
    return chart;
}

function centreInteret()
{
    document.getElementById("centreInteret").innerHTML="";
    
    let urlcentre ='https://jardindesconnaissances.univ-paris8.fr/THYP/20-21/g5/omk/api/items?resource_class_id[]=117';

var csv_data;   
var centre_interet = d3.queue()
    .defer(d3.json, urlcentre)
    .awaitAll(function(error, results) {
        if (error) throw error;
        csv_data=results;
        dataForm=csv_data;
        

        var centreInteret=  d3.select('#centreInteret').data(dataForm[0]);
      
        dataForm[0].forEach(function(d, j){
          
            
            var  centreInteretElements = centreInteret
            .append("div")
            .attr("class","rounded ")
            .style("display","inline-block")
            .style("padding","5px")
            .style("margin-right","16px")
            .style("margin-bottom","6px")
            .style("font-size","12px")
            .style("background-color","white")
            .style("border","1px solid rgb(26, 111, 218)");
            centreInteretElements
            .append("input")
            .attr("type","checkbox")
            .attr("onchange","filtreCentreInteret(this,'"+dataForm[0][j]["o:title"]+"')")
            .attr("class","align-middle")
            .style("margin-right","5px");
            centreInteretElements
            .append("label")
            .attr("class","form-check-label")
            .attr("for","exampleCheck1")
            .text(dataForm[0][j]["o:title"]);

        }

        );

    });
   
}

function filtreCentreInteret(checkbox,titre) {
    var indice=0;
    var new_data=[];
    if(checkbox.checked == true){
        
        const index = CentreInteretTab.indexOf(titre);
        if (index == -1) {
            CentreInteretTab.push(titre);
            console.log("CentreInteretTab "+CentreInteretTab);
        }
        
        dataForm = csv_data[0];
        console.log("début true "+dataForm);
        dataForm.forEach(function(d){
            var test=[];
            var v=false;
            var k=0;
            CentreInteretTab.forEach(
                function(item){
                    
                     v=false;
                    d["account:voc.tllhasInteret"].forEach(function(dd, j){
                        if(item==dd["display_title"])
                        {v=true;}
    
  
        
                        });
test[k]=v;
k++;
                  }
                
            
            );
            console.log("test ="+test);
            if(!test.includes(false)&&!new_data.includes(d))
            {
                
                new_data[indice]=d;
                indice++;
            }


        


          

        });
         
        
          setData(new_data,true);
    }else{
        
        const index = CentreInteretTab.indexOf(titre);
        if (index > -1) {
            CentreInteretTab.splice(index, 1);
           
        }

        dataForm = csv_data[0];
      
        if(CentreInteretTab.length==0)
        {setData(dataForm,true);}
        else{
            dataForm.forEach(function(d){
                var test=[];
                var v=false;
                var k=0;
                CentreInteretTab.forEach(
                    function(item){
                        
                         v=false;
                        d["account:voc.tllhasInteret"].forEach(function(dd, j){
                            if(item==dd["display_title"])
                            {v=true;}
 
            
                            });
    test[k]=v;
    k++;
                      }
                    
                
                );
              
                if(!test.includes(false)&&!new_data.includes(d))
                {
                    
                    new_data[indice]=d;
                    indice++;
                }
    
    
            
    
    
              
    
            });
        //console.log("fin false "+new_data);
        setData(new_data,true);}
   }
}
function detailsEmploye(id)
{// alert(id);
    var btnModal= document.getElementById('btnModal');
    var modalTitle= document.getElementById('modalTitle');
    var modalBody= document.getElementById('modalBody');
    modalBody.innerHTML="";
modalTitle.innerHTML="Profil numéro "+id;
let urlEmploye ='https://jardindesconnaissances.univ-paris8.fr/THYP/20-21/g5/omk/api/items/'+id;
var csv_data;          
var employe = d3.queue()
    .defer(d3.json, urlEmploye)
    .awaitAll(function(error, results) {
        if (error) throw error;
        csv_data=results;
        dataForm=csv_data;
        console.log("employe "+results);


       var infoEmploye= d3.select('#modalBody')
        .data(dataForm);
        infoEmploye.append('div').attr('class','col-12')
        .style("text-align","center")
        .append("img")
        .attr('src', function(d){return d["thumbnail_display_urls"]["square"];});

       
        var titre=  infoEmploye
        .append('div').attr('class','col-12')
        .style("text-align","left");
        titre.append('span')
        .style("font-weight","bold")
        .text("Titre : ");
        titre
        .append("span")
        .text(function(d){return d["dcterms:title"][0]["@value"];});

      var nom=  infoEmploye
        .append('div').attr('class','col-12')
        .style("text-align","left");
        nom.append('span')
        .style("font-weight","bold")
        .text("Nom : ");
        nom
        .append("span")
        .text(function(d){return d["foaf:lastName"][0]["@value"];});


        var prenom=  infoEmploye
        .append('div').attr('class','col-12')
        .style("text-align","left");
        prenom.append('span')
        .style("font-weight","bold")
        .text("Prénom : ");
        prenom
        .append("span")
        .text(function(d){return d["foaf:firstName"][0]["@value"];});

        
        var mail=  infoEmploye
        .append('div').attr('class','col-12')
        .style("text-align","left");
        mail.append('span')
        .style("font-weight","bold")
        .text("Mail : ");
        mail
        .append("a")
        .attr("href",function(d){return "mailto:"+d["foaf:mbox"][0]["@value"];})
        .text(function(d){return d["foaf:mbox"][0]["@value"];});

        
        var telephone=  infoEmploye
        .append('div').attr('class','col-12')
        .style("text-align","left");
        telephone.append('span')
        .style("font-weight","bold")
        .text("Téléphone : ");
        telephone
        .append("span")
        .text(function(d){return d["foaf:phone"][0]["@value"];});

        var poste=  infoEmploye
        .append('div').attr('class','col-12')
        .style("text-align","left");
        poste.append('span')
        .style("font-weight","bold")
        .text("Poste : ");
        poste
        .append("span")
        .text(function(d){return d["account:voc.tllposte"][0]["@value"];});
        var service=  infoEmploye
        .append('div').attr('class','col-12')
        .style("text-align","left");
        service.append('span')
        .style("font-weight","bold")
        .text("Service : ");
        service
        .append("span")
        .text(function(d){return d["account:voc.tllworkInService"][0]["display_title"];});

        var centreInteret=  infoEmploye
        .append('div').attr('class','col-12')
        .style("text-align","left");
        centreInteret.append('span')
        .style("font-weight","bold")
        .text("Centre d'intérêt : ");
//console.log( dataForm[0]["account:voc.tllhasInteret"]);
        dataForm[0]["account:voc.tllhasInteret"].forEach(function(d, j){
            var  centreInteretElements = centreInteret
            .append("div")
            .attr("class","rounded ")
            .style("display","inline-block")
            .style("padding","5px")
            .style("margin-right","16px")
            .style("margin-bottom","6px")
            .style("font-size","12px")
            .style("border","1px solid rgb(26, 111, 218)");
            centreInteretElements
            .append("input")
            .attr("type","checkbox")
            .attr("disabled","true")
            .attr("checked","")
            .attr("class","align-middle")
            .style("margin-right","5px");
            centreInteretElements
            .append("label")
            .attr("class","form-check-label")
            .attr("for","exampleCheck1")
            .text(function(d){return d["account:voc.tllhasInteret"][j]["display_title"];});

        }

        );
        var description=  infoEmploye
        .append('div').attr('class','col-12')
        .style("text-align","left");
        description.append('span')
        .style("font-weight","bold")
        .text("Description : ");
        description
        .append("span")
        .text(function(d){return d["dcterms:description"][0]["@value"];});

        var urlProfil=  infoEmploye
        .append('div').attr('class','col-12')
        .style("text-align","left");
        urlProfil.append('span')
        .style("font-weight","bold")
        .text("URL profil : ");
        urlProfil
        .append("a")
        .attr("href","https://jardindesconnaissances.univ-paris8.fr/THYP/20-21/g5/omk/api/items/"+id)
        .attr("target","_blank")
        .text("https://jardindesconnaissances.univ-paris8.fr/THYP/20-21/g5/omk/api/items/"+id);


                btnModal.click();
    });
    

}




