/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import model.Product;

public class CSVReader {

    public int csvImport(int cid) throws UnsupportedEncodingException {
        int flag = 0;
        int isFirst = 0;
        String csvFile = getPath() + "temp/temp.csv";
        String line = "";
        String cvsSplitBy = ",";

        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {

            while ((line = br.readLine()) != null) {
                if (isFirst == 1) {
                    String[] data = line.split(cvsSplitBy);
                    Product prod = new Product();
                    prod.setCategoryId(cid);
                    if(data[1]==null)
                    {
                        prod.setProductDesc("");
                    }
                    else if(data[1].equalsIgnoreCase("NULL"))
                    {
                    prod.setProductDesc("");
                    }
                    else
                    {
                        prod.setProductDesc(data[1]);
                    }
                    prod.setProductFile(data[2]);
                    prod.setProductFiletype(data[3]);
                    prod.setProductName(data[0]);
                    prod.setProductThumb(data[4]);
                    ProductController pc = new ProductController();
                    flag = pc.saveProduct(prod);
                    if (flag == 0) {
                        break;
                    }
                }
                isFirst = 1;
            }

        } catch (IOException e) {
            flag = 0;
            e.printStackTrace();
        }
        return flag;
    }

    private String getPath() throws UnsupportedEncodingException {
        String path = this.getClass().getClassLoader().getResource("").getPath();
        String fullPath = URLDecoder.decode(path, "UTF-8");
        String pathArr[] = fullPath.split("/WEB-INF/classes/");
        fullPath = pathArr[0];
        String reponsePath = "";
        // to read a file from webcontent
        reponsePath = new File(fullPath).getPath() + File.separatorChar;
        return /*getServletContext().getInitParameter("upload.location")*/ reponsePath;
    }

}
