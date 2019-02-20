Return-Path: <mspinler@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444Nzm3pRRzDqLk
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 03:56:36 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1KGs6wk077532
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 11:56:34 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qs8quy7fu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 11:56:34 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Wed, 20 Feb 2019 16:56:32 -0000
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 20 Feb 2019 16:56:29 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1KGuS0524313938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Feb 2019 16:56:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6778AC060;
 Wed, 20 Feb 2019 16:56:28 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F4D1AC062;
 Wed, 20 Feb 2019 16:56:28 +0000 (GMT)
Received: from [9.10.99.45] (unknown [9.10.99.45])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Feb 2019 16:56:28 +0000 (GMT)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.ibm.com>
Subject: sensor->inventory associations in phosphor-hwmon
Date: Wed, 20 Feb 2019 10:56:28 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------42D32705241DBD190876060F"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19022016-0040-0000-0000-000004C49784
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010632; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01163858; UDB=6.00606765; IPR=6.00944442; 
 MB=3.00025669; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-20 16:56:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022016-0041-0000-0000-000008CF99F8
Message-Id: <29a93725-5fb2-c302-a572-dec03340f814@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-20_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=937 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902200119
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
X-List-Received-Date: Wed, 20 Feb 2019 16:56:37 -0000

This is a multi-part message in MIME format.
--------------42D32705241DBD190876060F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

We have a need to know which sensor objects hosted by the various phosphor-hwmon
daemons belong to which inventory objects.  For example, we need to know that
the /xyz/openbmc_project/sensors/power/ps1_input_power sensor belongs to the
/xyz/openbmc_project/inventory/system/powersupply1 item.

To accomplish this, I am proposing we add a new environment variable to the
system specific phosphor-hwmon config files that the phosphor-hwmon code
can then use to create associations interfaces that will cause the mapper to
create the appropriate association D-Bus paths.

As an example, we could add to the power-supply1 conf file an ASSOCIATIONS
variable for each sensor (assuming ps1_input_power is represented by IN1):

     ASSOCIATIONS_IN1=/xyz/openbmc_project/inventory/system/powersupply1

The code would then see that and create a new org.openbmc.Associations interface
on the /xyz/openbmc_project/sensors/power/ps1_input_power path with an
associations property of:

     ["inventory",
      "sensors",
      "/xyz/openbmc_project/inventory/system/powersupply1"]

This leads to the mapper creating:

     /xyz/openbmc_project/sensors/power/ps1_input_power/inventory

With an xyz.openbmc_project.Association interface with an
endpoints property of:

     ["/xyz/openbmc_project/inventory/system/powersupply1"]

And also the other association path:

     /xyz/openbmc_project/inventory/system/powersupply1/sensors

With an xyz.openbmc_project.Association interface with an
endpoints property of:

     ["/xyz/openbmc_project/sensors/power/ps1_input_power"]

This now allows one to both find all sensors associated with a power supply, and
find which inventory item is associated with a particular sensor.  Note that
the endpoints property is an array, and can get entries from multiple places.

I suppose we could also put the forward/reverse association names, in this case
"inventory" and "sensors", into the hwmon config file, and also allow creating
multiple associations for each sensor if there is a usecase, though I would like
to keep it as simple as possible:

ASSOCIATIONS1_IN1=inventory,sensors,/xyz/openbmc_project/inventory/system/powersupply1
ASSOCIATIONS2_IN1=chassis,contained_sensors,/xyz/openbmc_project/inventory/system/chassis

What does everyone think?

Thanks
Matt


--------------42D32705241DBD190876060F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre>Hi,

We have a need to know which sensor objects hosted by the various phosphor-hwmon
daemons belong to which inventory objects.  For example, we need to know that
the /xyz/openbmc_project/sensors/power/ps1_input_power sensor belongs to the
/xyz/openbmc_project/inventory/system/powersupply1 item.

To accomplish this, I am proposing we add a new environment variable to the
system specific phosphor-hwmon config files that the phosphor-hwmon code
can then use to create associations interfaces that will cause the mapper to
create the appropriate association D-Bus paths.

As an example, we could add to the power-supply1 conf file an ASSOCIATIONS
variable for each sensor (assuming ps1_input_power is represented by IN1):

    ASSOCIATIONS_IN1=/xyz/openbmc_project/inventory/system/powersupply1

The code would then see that and create a new org.openbmc.Associations interface
on the /xyz/openbmc_project/sensors/power/ps1_input_power path with an
associations property of:

    ["inventory",
     "sensors",
     "/xyz/openbmc_project/inventory/system/powersupply1"]

This leads to the mapper creating:

    /xyz/openbmc_project/sensors/power/ps1_input_power/inventory

With an xyz.openbmc_project.Association interface with an
endpoints property of:

    ["/xyz/openbmc_project/inventory/system/powersupply1"]

And also the other association path:

    /xyz/openbmc_project/inventory/system/powersupply1/sensors

With an xyz.openbmc_project.Association interface with an
endpoints property of:

    ["/xyz/openbmc_project/sensors/power/ps1_input_power"]

This now allows one to both find all sensors associated with a power supply, and
find which inventory item is associated with a particular sensor.  Note that
the endpoints property is an array, and can get entries from multiple places.

I suppose we could also put the forward/reverse association names, in this case
"inventory" and "sensors", into the hwmon config file, and also allow creating
multiple associations for each sensor if there is a usecase, though I would like
to keep it as simple as possible:

ASSOCIATIONS1_IN1=inventory,sensors,/xyz/openbmc_project/inventory/system/powersupply1
ASSOCIATIONS2_IN1=chassis,contained_sensors,/xyz/openbmc_project/inventory/system/chassis

What does everyone think?

Thanks
Matt</pre>
  </body>
</html>

--------------42D32705241DBD190876060F--
