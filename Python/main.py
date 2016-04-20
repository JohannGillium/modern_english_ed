import os
from ed_folder import start_ed
from xslt_handler import process_xml
import lxml.etree as etree 

#Need to create here some global variable 

for i in os.listdir('/home/jgillium/Bureau/Corpus_modern_english/sample'):
    xslt_path = '/home/jgillium/Bureau/Ed_modern_english/XSLT/modern_english_corpus.xsl'
    folder_path = '/home/jgillium/Bureau/Corpus_modern_english/sample' 
    name_file_without_extension = os.path.splitext(i)[0]
    folder_mdf = os.path.join('/home/jgillium/Bureau/Ed_modern_english/Output',name_file_without_extension,'_texts')
    name_file_without_extension = os.path.splitext(i)[0]
    name_markdown_file = name_file_without_extension+'.md'
    print name_markdown_file
    path_output = os.path.join(folder_mdf,name_markdown_file)                 
    xml_path = os.path.join(folder_path,i)
    ed_repository_creation = start_ed(name_file_without_extension)
    markdown_file_creation = process_xml(name_file_without_extension, xml_path, xslt_path, path_output)
    

    



