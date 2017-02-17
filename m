Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPqzd3gF6zDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 22:09:33 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1HB9Peu080678
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 06:09:31 -0500
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28nrgkqqrd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 06:09:30 -0500
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Fri, 17 Feb 2017 21:09:09 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 17 Feb 2017 21:09:06 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id B68F12CE8046
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 22:09:05 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1HB8v5p36896976
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 22:09:05 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v1HB8XL4015196
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 22:08:33 +1100
Received: from [9.199.66.236] ([9.199.66.236])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v1HB8WbA014781
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 22:08:33 +1100
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Subject: Anybody knows the use of "Beep / Heartbeat / Identify" LEDs on
 Barreleye ?
Date: Fri, 17 Feb 2017 16:38:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021711-0008-0000-0000-0000010BCA95
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021711-0009-0000-0000-00000912D348
Message-Id: <3f3d273d-26e1-11b3-fc6f-b414ee238e42@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-17_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 spamscore=1 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702170105
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
X-List-Received-Date: Fri, 17 Feb 2017 11:09:33 -0000

All,

I am working on defining the LED group names as part of new LED 
management daemon and looking for naming these LED groups.

Wanted to know under what use-cases an operation ( Blink / Solid on ) 
would be triggered on these LEDs (Beep | Heartbeat | Identify") on 
Barreleye ?

Thanks.

!! Vishwa !!
