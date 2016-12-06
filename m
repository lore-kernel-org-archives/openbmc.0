Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYFh74Kb1zDvk4
 for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2016 08:51:35 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uB6LnZS9053002
 for <openbmc@lists.ozlabs.org>; Tue, 6 Dec 2016 16:51:33 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 275u7vmdgc-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 06 Dec 2016 16:51:32 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Tue, 6 Dec 2016 16:51:31 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 6 Dec 2016 16:51:29 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 2A84C6E803C
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 16:51:02 -0500 (EST)
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uB6LpSMw41222254
 for <openbmc@lists.ozlabs.org>; Tue, 6 Dec 2016 21:51:28 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56EF1112047
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 16:51:28 -0500 (EST)
Received: from [9.10.99.99] (unknown [9.10.99.99])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 37ECC112051
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 16:51:28 -0500 (EST)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: Supporting different temp sensors at same I2C location
Date: Tue, 6 Dec 2016 15:51:40 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120621-0056-0000-0000-00000222A714
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006206; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000194; SDB=6.00790225; UDB=6.00382664; IPR=6.00567965; 
 BA=6.00004946; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013560; XFM=3.00000011;
 UTC=2016-12-06 21:51:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120621-0057-0000-0000-00000655BE28
Message-Id: <8d6aac0e-9d92-3ad9-67ea-f9cbf9032377@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-06_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1612060322
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
X-List-Received-Date: Tue, 06 Dec 2016 21:51:36 -0000

On Witherspoon the hardware team is asking us(or maybe warning us?) if 
they can change the ambient temp/altitude sensor from the BMP280 to a 
DPS310, which would have the same I2C address.  Only the new one would ship.

How are things like this usually handled in Linux?  Can both drivers be 
kept around and just activate based on their probing? Or do we just drop 
support for the old chip completely, though I haven't asked if this is 
OK yet.  Or should we push for having a different I2C address and then 
support both still?

Thanks
