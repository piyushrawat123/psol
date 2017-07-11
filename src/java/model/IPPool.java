/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.net.util.SubnetUtils;

import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Column;

@Entity
@Table(name = "tb_opgateway_ipseries")
@NamedQueries({ @NamedQuery(name = "IPPool.findAllEnable",
query = "SELECT b FROM IPPool b where b.status=:status")			
		})
public class IPPool {
	
	@Id	
	@Column(name = "gwip_id", unique = true, nullable = false)
	@GeneratedValue
	
	private Integer gwipId;                 
	@Column(name = "ip_address")
	private String ipAddress;        
	@Column(name = "op_id")
	private Integer opid;       
	@Column(name = "circle_id")
	private Long circleId;    
	@Column(name = "date_of_creation")
	private Timestamp dateOfCreation;      
	@Column(name = "last_update")
	private Timestamp lastUpdate;         
	private Boolean status;
	
	@Transient
	private SubnetUtils subnetUtils;
	
	public Integer getGwipId() {
		return gwipId;
	}
	public void setGwipId(Integer gwipId) {
		this.gwipId = gwipId;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	
	public Long getCircleId() {
		return circleId;
	}
	public void setCircleId(Long circleId) {
		this.circleId = circleId;
	}
	public Timestamp getDateOfCreation() {
		return dateOfCreation;
	}
	public void setDateOfCreation(Timestamp dateOfCreation) {
		this.dateOfCreation = dateOfCreation;
	}
	public Timestamp getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(Timestamp lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public SubnetUtils getSubnetUtils() {
		return subnetUtils;
	}
	public void setSubnetUtils(SubnetUtils subnetUtils) {
		this.subnetUtils = subnetUtils;
	}
	public Integer getOpid() {
		return opid;
	}
	public void setOpid(Integer opid) {
		this.opid = opid;
	}
	}
