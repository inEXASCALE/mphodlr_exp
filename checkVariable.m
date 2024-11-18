function checkVariable(this) 
   props = properties(this); 
   evalsize = 0; 
   
   for ii=1:length(props) 
      currentProperty = getfield(this, char(props(ii))); 
      s = whos('currentProperty'); 
      evalsize = evalsize + s.bytes; 
   end
  
   fprintf(1, '%d bytes\n', evalsize); 
end
