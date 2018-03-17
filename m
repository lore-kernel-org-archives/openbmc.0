Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 403LCy3NkDzDqjt
 for <openbmc@lists.ozlabs.org>; Sat, 17 Mar 2018 22:47:25 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2HBhlKK111774
 for <openbmc@lists.ozlabs.org>; Sat, 17 Mar 2018 07:47:22 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2grxwucyx6-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 17 Mar 2018 07:47:22 -0400
Received: from localhost
 by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Sat, 17 Mar 2018 11:47:21 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sat, 17 Mar 2018 11:47:19 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2HBlIte37814378
 for <openbmc@lists.ozlabs.org>; Sat, 17 Mar 2018 11:47:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3076BA404D
 for <openbmc@lists.ozlabs.org>; Sat, 17 Mar 2018 11:40:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A861EA4040
 for <openbmc@lists.ozlabs.org>; Sat, 17 Mar 2018 11:40:04 +0000 (GMT)
Received: from [9.77.89.56] (unknown [9.77.89.56])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Sat, 17 Mar 2018 11:40:04 +0000 (GMT)
To: openbmc@lists.ozlabs.org
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: RFC for Implement SNMP trap on openBMC.
Date: Sat, 17 Mar 2018 17:17:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18031711-0040-0000-0000-000004424684
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031711-0041-0000-0000-000020E557EC
Message-Id: <4d0a0aa4-bd51-f72c-af18-5842d1f08456@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803170149
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Mar 2018 11:47:27 -0000

Hi All,

I am working on the 
issue(https://github.com/openbmc/openbmc/issues/3002) to Implement SNMP 
trap notification support on openBMC.
I would be explaining a rough idea of how we plan to go about.
Please share your thoughts and feedback on this proposal.

Requirement:- Enable support for SNMP trap notification on openbmc.
               Currently the requirement is to send the SNMP trap in the 
following cases
               1) Whenever the error log gets created.
               2) Whenever the BMC state changes to runtime.

NOTE:- In future We would extend the support of sending trap in other 
use cases.
               1) Sending the sensor telemetry data.
               2) Application specific use cases.
                    eg:- Multiple Authentication failure.

Configurable Trap Parameters
===================

1) Manager IP
2) Interested Trap types
     Notice
         Warning
         Critical


How to configure the SNMP Manager IP on bmc?

- Through REST (and hence D-Bus) API

We can define the MIB structure depending on the eventType

eg

==>eventType = ErrorLog

Structure for errorLog MIB
================
AgentIP   :   BMC IP Address
TimeStamp :   Time when the trap generated
deviceName:-  DbusObjectPath
alertLevel:-  Would be given by the config yaml
     Following properties data would be fetched by making Dbus call on 
that object.
ErrorId:
ErrorSeverity:
ErrorMessage:
ErrorAdditionalData{array of key value}:
ErrorResolutionStatus:

===>eventType = Configuration
AgentIP   :   BMC IP Address
TimeStamp :   Time when the trap generated
deviceName:-  DbusObjectPath
alertLevel:-  Would be given by the config yaml
eventMessage:- "BMC state changed"
PropertyName:-
PropertyValue:-

Implement the snmp trap feature
=====================

Currently on openbmc the data is being modeled as D-bus Object so we 
would be
leveraging the capabilities given by the existing 
app(phosphor-Dbus-Monitor) to get the
triggers on following conditions to generate the snmp trap.

1) whenever the new object gets added
       eg error object under /xyz/openbmc_project/Logging

2) There is some property change on the configured D-bus object
       eg Network configuration change.

3) Some property reached a specific value/threshold value.
       eg BMC state change to "poweron" or CPU temperature is > X

NOTE:- There could be cases which is independent on the D-bus object
        eg:- Generate a trap whenever there is multiple authentication 
failure
        We would expose a D-bus api to generate a trap to handle application
        specific use cases.

Config YAML of Phosphor-Dbus-Monitor
========================
- name: create property event
   class: callback
   callback: snmpEvent
   paths: D-bus path group
   properties: Group of interested Properties
   eventSeverity: Notice/Warning/Critical
   eventType: Error log / Sensor / State.
   eventMessage: "User can give the message as per the eventType"
          PropertyChange:- Normal property Change could be eventType as 
Notice eg:- StateChange/Network Configuration change
          PropertyChange would become Warning:- if we have met a 
specific condition on a property
                            eg Proc Temprature > some configured 
temperature value.

Opensource:- NetSnmp
              Comes up with full suite of tools like snmp 
agent,snmptrapd, mib2c, bunch of other tools
              Currently the support is for trap so we need minimal of 
above(libsnmp,mib2c).

Regards

Ratan Gupta
