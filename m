Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSByV3f1rzDvY9
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 03:31:28 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uASGSulA074890
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 11:31:25 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 270r47rau8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 11:31:24 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 28 Nov 2016 11:31:23 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 28 Nov 2016 11:31:21 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 67BB46E801D;
 Mon, 28 Nov 2016 11:30:55 -0500 (EST)
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uASGVLu734603116; Mon, 28 Nov 2016 16:31:21 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B04B2046;
 Mon, 28 Nov 2016 11:31:21 -0500 (EST)
Received: from [9.10.99.99] (unknown [9.10.99.99])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id 1B37CB2058;
 Mon, 28 Nov 2016 11:31:21 -0500 (EST)
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: Starting the phosphor-hwmon service from udev rules
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 28 Nov 2016 10:31:20 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112816-0040-0000-0000-000001FB7DFB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006157; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000193; SDB=6.00786466; UDB=6.00380317; IPR=6.00564154; 
 BA=6.00004920; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013470; XFM=3.00000011;
 UTC=2016-11-28 16:31:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112816-0041-0000-0000-000005ED85F0
Message-Id: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-28_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611280271
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2016 16:31:31 -0000

I am working on a story this sprint to start the phosphor-hwmon service 
from udev rules.  In addition to just starting the service based on a 
device path, I need to be able to communicate to it some threshold 
values, like critical high temps for example.

I have a proposal for the rules at 
https://gerrit.openbmc-project.xyz/#/c/1243/.

It has lines like:

SUBSYSTEM=="hwmon", DEVPATH=="*i2c-3/3-0077/*", ACTION == "add", 
TAG+="systemd", 
ENV{SYSTEMD_WANTS}+="phosphor-hwmon@/sys/class/hwmon/%k.service", 
ENV{ENVFILE}+="/etc/hwmon.d/hwmon-bmp280-3-77.conf"

where the .conf file will contain any threshold values, maybe like 
CRIT=50.  The command line in the unit file would then somehow make a 
udevadm call to pull out the ENVFILE so it can get passed into the 
executable along with the device path.

Is this the recommended way to go about doing this?  Or instead of 
having a separate udev rule for each device, but 1 service file, is it 
better to have 1 udev rule but separate service files?

Thanks
