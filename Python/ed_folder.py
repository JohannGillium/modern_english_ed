import os
import logging
import shutil
import distutils
import glob
import yaml
from yaml import dump
from os import path
from distutils import dir_util
#
class ed:
#Ici, c'est l'endroit pour affecter des attributs de classe, notamment ici le ed_repository

    def __init__(self, book):
#Dans le constructeur d'une classe, on declare tous les attributs des objets qui peupleront cette classe
        self.book = book

    def make(self,cufolder):
        dir_to_create = os.path.join(cufolder,self.book)
        repository = os.makedirs(dir_to_create)

    def ed_structure(self,cufolder,ed_repository):
        dir_to_create = os.path.join(cufolder,self.book)
        distutils.dir_util.copy_tree(ed_repository,dir_to_create)   

    # def add_mdt_ed_repository(name):
                   

def start_ed(book):
    processed_file = ed(book)
    ed_repository = 'ed'
    cufolder ='/home/jgillium/Bureau/Ed_modern_english/Output'
    processed_file.make(cufolder)
    repository_population = processed_file.ed_structure(cufolder,ed_repository)




        
