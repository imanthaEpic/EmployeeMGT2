/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author imant
 */
import java.io.Serializable;

public class DashboardBean implements Serializable {
    private int totalEmployees;
    private int activeEmployees;
    private int deactivatedEmployees;

    public DashboardBean(int totalEmployees, int activeEmployees, int deactivatedEmployees) {
        this.totalEmployees = totalEmployees;
        this.activeEmployees = activeEmployees;
        this.deactivatedEmployees = deactivatedEmployees;
    }

    public DashboardBean() {
    }

    public int getTotalEmployees() {
        return totalEmployees;
    }

    public void setTotalEmployees(int totalEmployees) {
        this.totalEmployees = totalEmployees;
    }

    public int getActiveEmployees() {
        return activeEmployees;
    }

    public void setActiveEmployees(int activeEmployees) {
        this.activeEmployees = activeEmployees;
    }

    public int getDeactivatedEmployees() {
        return deactivatedEmployees;
    }

    public void setDeactivatedEmployees(int deactivatedEmployees) {
        this.deactivatedEmployees = deactivatedEmployees;
    }
}
