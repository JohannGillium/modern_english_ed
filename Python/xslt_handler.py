import lxml.etree as etree 

class xslt:

    def __init__(self, book, xml_path, xslt_path, path_output):
#Dans le constructeur d'une classe, on declare tous les attributs des objets qui peupleront cette classe
        self.book = book
        self.xml_path = xml_path
        self.xslt_path = xslt_path
        self.path_output = path_output
    def transform(self):
  #      parser = etree.XMLParser(recover=True)
  #      doc = etree.parse(self.xml_path, parser)
        parser = etree.XMLParser(no_network=False)
        doc = etree.parse(self.xml_path, parser)
  #      parser.error_log  
        xslt_root = etree.fromstring(open(self.xslt_path).read())
        transform = etree.XSLT(xslt_root)
        result_tree = transform(doc)
        output_file = open(self.path_output, "w")
        output_file.write(str(result_tree))

def process_xml(book, xml_path, xslt_path, path_output):
    param_stylesheet = xslt(book, xml_path, xslt_path, path_output)
    param_stylesheet.transform()
