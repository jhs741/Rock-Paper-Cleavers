function answer=askprompt()

prompt = {'Please enter participant ID:', 'Please enter group:', 'Have you ever made an origami paper crane or box before? How much origami experience do you have?:'};
title = 'Input';
dims=[5 75];
tempanswer = inputdlg(prompt,title,dims);
answer(:)=string(tempanswer);

end