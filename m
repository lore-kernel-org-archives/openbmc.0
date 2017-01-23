Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6bZ359Z7zDqJn
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jan 2017 02:58:03 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0NFscv8098532
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 10:58:00 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 285jbt8e84-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 10:58:00 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.vnet.ibm.com>;
 Mon, 23 Jan 2017 10:57:59 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 23 Jan 2017 10:57:56 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 5FAB638C8041;
 Mon, 23 Jan 2017 10:57:57 -0500 (EST)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0NFvui010813910; Mon, 23 Jan 2017 15:57:56 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B3A1AE03B;
 Mon, 23 Jan 2017 10:57:56 -0500 (EST)
Received: from [9.10.99.149] (unknown [9.10.99.149])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id EC9E2AE05C;
 Mon, 23 Jan 2017 10:57:55 -0500 (EST)
To: Joel Stanley <joel@jms.id.au>
Cc: bradleyb@fuzziesquirrel.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Barth <msbarth@linux.vnet.ibm.com>
Subject: GPIO expander user space access(ie. pca9552)
Date: Mon, 23 Jan 2017 09:58:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17012315-0040-0000-0000-0000026F4310
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006484; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000200; SDB=6.00811585; UDB=6.00395705; IPR=6.00589001; 
 BA=6.00005084; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014015; XFM=3.00000011;
 UTC=2017-01-23 15:57:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17012315-0041-0000-0000-000006624712
Message-Id: <6af19fb7-e5aa-bcb5-8027-9cf609e30eda@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-23_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701230216
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
X-List-Received-Date: Mon, 23 Jan 2017 15:58:04 -0000

Is there a defined process/interface to access GPIO expanders from user 
space to be able to determine when the state changes? Possibly polling a 
fd or getting notified on the state change?

Previously this was an i2c device that was accessed over i2c and the set 
of interested bits were simply read into the application. An example is 
the use of a pca9552 for presence detection on chassis fans.

Thanks,

Matt
