Return-Path: <msbarth@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405vnp3VXGzDr7y
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 03:07:07 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2LG6Q6p032504
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 12:07:04 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gurspe6ye-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 12:07:03 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.vnet.ibm.com>;
 Wed, 21 Mar 2018 12:07:01 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 21 Mar 2018 12:06:59 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2LG6wjt42532980; Wed, 21 Mar 2018 16:06:58 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE31E2803F;
 Wed, 21 Mar 2018 12:06:21 -0400 (EDT)
Received: from [9.10.99.92] (unknown [9.10.99.92])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id ACBFF2803D;
 Wed, 21 Mar 2018 12:06:21 -0400 (EDT)
To: openbmc@lists.ozlabs.org
Cc: venture@google.com, mspinler@linux.vnet.ibm.com
From: Matthew Barth <msbarth@linux.vnet.ibm.com>
Subject: phosphor-hwmon: Removal of sensors from dbus
Date: Wed, 21 Mar 2018 11:06:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18032116-0040-0000-0000-0000040AE413
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008716; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01006338; UDB=6.00512397; IPR=6.00785620; 
 MB=3.00020164; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-21 16:07:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032116-0041-0000-0000-0000080BEA8C
Message-Id: <c6cfc2d6-a69c-0e13-1426-61506015d514@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803210188
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
X-List-Received-Date: Wed, 21 Mar 2018 16:07:10 -0000

In regard to the following issue, please provide any feedback or other 
ideas:

https://github.com/openbmc/openbmc/issues/2327

After investigating how hwmon currently handles returned error codes of 
sensors I've come up with a couple ideas where one of them seems to be 
the most optimal choice that I'll describe here (please refer to the 
issue on the other).

Currently there's a configure option, that when enabled, removes a 
sensor from dbus and allows hwmon to continue when an error on reading 
the sensor occurs. I would like to enhance this change to make a hwmon 
config file entry that could be used per sensor of a device that defines 
a comma separated list of what return code(s) would cause that sensor to 
be removed from dbus. This allows the greatest flexibility in handling 
how error codes should be handled for a device's sensor(s).

e.g.

LABEL_temp198 = "gpu0_core_temp"

REMOVERC_temp198 = EAGAIN


In addition to this, it may also be possible to include the changes 
needed where this REMOVERC config entry could be "globally" defined 
where any sensor provided by that device's hwmon config file that 
returns the given error code(s) would be removed from dbus. I have not 
looked into the effort involved with the change described here, but it 
would just be a further enhancement to the one described above.

Thanks,

Matt
