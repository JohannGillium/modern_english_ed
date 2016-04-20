import os
from ed_folder import start_ed
import lxml.etree as etree 

#Need to create here some global variable 

for i in os.listdir('/home/jgillium/Bureau/Corpus_modern_english/sample'):
    XSLT_path = '/home/jgillium/Bureau/Ed_modern_english/XSLT/modern_english_corpus.xsl'
    folder_path = '/home/jgillium/Bureau/Corpus_modern_english/sample'                  
    xml_path = os.path.join(folder_path,i)
    name_file_without_extension = os.path.splitext(i)[0]
    folder_mdf = '/home/jgillium/Bureau/Ed_modern_english/Output'
    name_markdown_file = name_file_without_extension+'.md'
    path_markdown_file = os.path.join(folder_mdf,name_markdown_file)
    print name_markdown_file
    parser = etree.XMLParser(recover=True)
    doc = etree.parse(xml_path, parser)
    parser.error_log  
    xslt_root = etree.fromstring(open(XSLT_path).read())
    transform = etree.XSLT(xslt_root)
    result_tree = transform(doc)
    output_file = open(path_markdown_file, "w")
    output_file.write(str(result_tree))
    processed_file = start_ed(name_file_without_extension)
    



