Return-Path: <mspinler@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44F31V1WfdzDqB3
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 05:58:05 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x26IsWot027588
 for <openbmc@lists.ozlabs.org>; Wed, 6 Mar 2019 13:58:02 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r2kcs9k4j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 13:58:02 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Wed, 6 Mar 2019 18:58:01 -0000
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Mar 2019 18:57:59 -0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x26Ivw2f51839032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 6 Mar 2019 18:57:58 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A9F5C6055
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 18:57:58 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2617FC605A
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 18:57:58 +0000 (GMT)
Received: from [9.10.99.45] (unknown [9.10.99.45])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 18:57:57 +0000 (GMT)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.ibm.com>
Subject: Inventory Associations
Date: Wed, 6 Mar 2019 12:57:57 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19030618-0004-0000-0000-000014EACE2C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010716; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01170553; UDB=6.00611777; IPR=6.00951192; 
 MB=3.00025861; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-06 18:58:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030618-0005-0000-0000-00008AD09EB5
Message-Id: <799da537-6f36-2478-6bae-526de8597e91@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-06_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=766 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903060130
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2019 18:58:06 -0000

Hi,

I put some functionality into phosphor-inventor-manager (almost up for 
review)
to be able to add mapper associations for inventory objects that it 
hosts based
on a system specific JSON File.

The associations that get created should probably be common across inventory
implementations, so I propose:

1) Associating sensors to the inventory entry they sense for using the
    'inventory' and 'sensors' association types:

#forward association:
"/xyz/openbmc_project/inventory/system/chassis/motherboard/dimm8/sensors": {
     "endpoints": [
     "/xyz/openbmc_project/sensors/temperature/dimm8_temp"
     ]
},

#reverse association:
"/xyz/openbmc_project/sensors/temperature/dimm8_temp/inventory": {
     "endpoints": [
"/xyz/openbmc_project/inventory/system/chassis/motherboard/dimm8"
     ]
},

2) Associating LEDs to the entries they indicate for using the 
'inventory' and
    'leds' association types:

#forward association:
"/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0/leds": {
     "endpoints": [
     "/xyz/openbmc_project/led/physical/fan0"
     ]
},

#reverse association:
"/xyz/openbmc_project/led/physical/fan0/inventory"
     "endpoints": [
"/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0"
     ]


Does this meet the Redfish needs?

Thanks,
Matt
