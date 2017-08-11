Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTVZj25SWzDr5C
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 02:19:40 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7BGJX7P096341
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 12:19:38 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c9c4pmwdh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 12:19:37 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Sat, 12 Aug 2017 02:18:52 +1000
Received: from d23relay09.au.ibm.com (202.81.31.228)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sat, 12 Aug 2017 02:18:50 +1000
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7BGIo0132833598
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 02:18:50 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v7BGInUM011924
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 02:18:49 +1000
Received: from [9.77.206.116] ([9.77.206.116])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v7BGImH1011868
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 02:18:49 +1000
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Subject: Design proposal to Non-Interactive password update for REST client
Date: Fri, 11 Aug 2017 21:48:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17081116-0048-0000-0000-00000258245C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081116-0049-0000-0000-0000480BC926
Message-Id: <f2f1b160-cb20-e02f-1a88-3dffbeacc76e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708110259
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
X-List-Received-Date: Fri, 11 Aug 2017 16:19:41 -0000

This email is about openbmc/openbmc#1714 ( REST API to update root 
password )

Goal is to do Non-interactive password updates to enable a REST client 
to update the root password.

My proposal is to use `getspent(3)` and `putspent(3)` and here is the flow.

REST client will provide a method that takes std::string as parameter.

The Provider at the BMC will receive the password and does these:

  - Executes `getspent(3)` for "root" and gets the entries.
  - Parses the `sp_pwdp` and extracts `encryption method` , `salt`.
  - Makes a call to `crypt(3)` with the extracted `salt` and `user 
input` and generates encrypted pass-code
  - Populates the structure and calls `putspent(3)` to update the password

Please let me know your opinion on this.

Thank you,

!! Vishwa !!
