/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ADMIN
 */
public class ViewGradeDao {
    private String aname;
   private double weight;
   private double score;

    public ViewGradeDao(String aname, double weight, double score) {
        this.aname = aname;
        this.weight = weight;
        this.score = score;
    }

    public String getAname() {
        return aname;
    }

    public double getWeightByPercentage() {
        return weight * 100;
    }

    public double getScore() {
        return score;
    }
    
    
}
