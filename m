Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40QKtG1Gy2zDrJw
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 19:37:57 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3H9ahwa020556
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 05:37:55 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hdbbm95uu-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 05:37:54 -0400
Received: from localhost
 by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 17 Apr 2018 10:37:52 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 17 Apr 2018 10:37:51 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3H9boDa55443468
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 09:37:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C15FAE04D
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 10:27:41 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BF0BAE045
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 10:27:40 +0100 (BST)
Received: from [9.78.199.203] (unknown [9.78.199.203])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 10:27:39 +0100 (BST)
Subject: Re: RFC for Implement SNMP trap on openBMC.
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
References: <4d0a0aa4-bd51-f72c-af18-5842d1f08456@linux.vnet.ibm.com>
Date: Tue, 17 Apr 2018 15:07:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <4d0a0aa4-bd51-f72c-af18-5842d1f08456@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18041709-0040-0000-0000-0000044E71CC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041709-0041-0000-0000-000020F2B8CD
Message-Id: <f4f64100-10fd-9337-cd6a-ff6c14fa9502@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804170086
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
X-List-Received-Date: Tue, 17 Apr 2018 09:37:58 -0000

Hi All,

Further extending my last proposal.

Create a repo phosphor-snmp which would be exposing a lib named libsnmp.

Any process which wants to send the trap link that process with this lib
and call the following function to send the trap.

Prototype of sending trap function is below.

template<typename T, typename... ArgTypes>
void sendTrap(ArgTypes&&... tArgs)

T = Notification Type.

This Notification Type class needs to be defined and it would be defined
by the parser at build time by reading the mib file.

This parser would be custom written parser to generate these classes as 
we can not
use the mib2c for the same.

We would be using the netsnmp lib for sending the trap.

Configuration of SNMP Manager

    SNMP Manager Ip/port would be configured under the settings namespace.

How to add the new Notification
===============================
=> Define the intended notification object in the mib.
=> Write the specific notification class until parser is ready.


How to use the lib.
===================
eg

Suppose we want to send the Error Notification with some data.

sendTrap<ErrorNotification>(arg,.....);


Content in the error Notification Mib
====================================
1) ErrorId
2) Timestamp
3) Severity
4) ErrorMessage(should be small enough to be fit in single MTU.)

NOTE:-  Currently in error object through REST we send other properties 
like"additional data",
         but we can not send the same info through SNMP trap as it makes 
the trap heavy.
         seems to me that is not the intent of the trap to get all the 
info of the object.
         Fo such requirement we should support snmp agent SNMP-GET on 
that object.

Need opinion from the community members on this proposal as well as the
content of the Error Notification Mib.

Regards
Ratan Gupta


On Saturday 17 March 2018 05:17 PM, Ratan Gupta wrote:
> Hi All,
>
> I am working on the 
> issue(https://github.com/openbmc/openbmc/issues/3002) to Implement 
> SNMP trap notification support on openBMC.
> I would be explaining a rough idea of how we plan to go about.
> Please share your thoughts and feedback on this proposal.
>
> Requirement:- Enable support for SNMP trap notification on openbmc.
>               Currently the requirement is to send the SNMP trap in 
> the following cases
>               1) Whenever the error log gets created.
>               2) Whenever the BMC state changes to runtime.
>
> NOTE:- In future We would extend the support of sending trap in other 
> use cases.
>               1) Sending the sensor telemetry data.
>               2) Application specific use cases.
>                    eg:- Multiple Authentication failure.
>
> Configurable Trap Parameters
> ===================
>
> 1) Manager IP
> 2) Interested Trap types
>     Notice
>         Warning
>         Critical
>
>
> How to configure the SNMP Manager IP on bmc?
>
> - Through REST (and hence D-Bus) API
>
> We can define the MIB structure depending on the eventType
>
> eg
>
> ==>eventType = ErrorLog
>
> Structure for errorLog MIB
> ================
> AgentIP   :   BMC IP Address
> TimeStamp :   Time when the trap generated
> deviceName:-  DbusObjectPath
> alertLevel:-  Would be given by the config yaml
>     Following properties data would be fetched by making Dbus call on 
> that object.
> ErrorId:
> ErrorSeverity:
> ErrorMessage:
> ErrorAdditionalData{array of key value}:
> ErrorResolutionStatus:
>
> ===>eventType = Configuration
> AgentIP   :   BMC IP Address
> TimeStamp :   Time when the trap generated
> deviceName:-  DbusObjectPath
> alertLevel:-  Would be given by the config yaml
> eventMessage:- "BMC state changed"
> PropertyName:-
> PropertyValue:-
>
> Implement the snmp trap feature
> =====================
>
> Currently on openbmc the data is being modeled as D-bus Object so we 
> would be
> leveraging the capabilities given by the existing 
> app(phosphor-Dbus-Monitor) to get the
> triggers on following conditions to generate the snmp trap.
>
> 1) whenever the new object gets added
>       eg error object under /xyz/openbmc_project/Logging
>
> 2) There is some property change on the configured D-bus object
>       eg Network configuration change.
>
> 3) Some property reached a specific value/threshold value.
>       eg BMC state change to "poweron" or CPU temperature is > X
>
> NOTE:- There could be cases which is independent on the D-bus object
>        eg:- Generate a trap whenever there is multiple authentication 
> failure
>        We would expose a D-bus api to generate a trap to handle 
> application
>        specific use cases.
>
> Config YAML of Phosphor-Dbus-Monitor
> ========================
> - name: create property event
>   class: callback
>   callback: snmpEvent
>   paths: D-bus path group
>   properties: Group of interested Properties
>   eventSeverity: Notice/Warning/Critical
>   eventType: Error log / Sensor / State.
>   eventMessage: "User can give the message as per the eventType"
>          PropertyChange:- Normal property Change could be eventType as 
> Notice eg:- StateChange/Network Configuration change
>          PropertyChange would become Warning:- if we have met a 
> specific condition on a property
>                            eg Proc Temprature > some configured 
> temperature value.
>
> Opensource:- NetSnmp
>              Comes up with full suite of tools like snmp 
> agent,snmptrapd, mib2c, bunch of other tools
>              Currently the support is for trap so we need minimal of 
> above(libsnmp,mib2c).
>
> Regards
>
> Ratan Gupta
>
