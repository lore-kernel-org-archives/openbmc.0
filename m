Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vswDw3ry9zDqY4
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 02:44:32 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2SFXsNs113830
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 11:44:24 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29ft6f9w2a-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 11:44:24 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Tue, 28 Mar 2017 09:44:24 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 28 Mar 2017 09:44:21 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2SFiKLv15728986
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 08:44:20 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98A9FC603E
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 09:44:20 -0600 (MDT)
Received: from [9.10.222.239] (unknown [9.10.222.239])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 7512BC6037
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 09:44:20 -0600 (MDT)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: OpenBMC commands for interacting with Cronus
Date: Tue, 28 Mar 2017 10:44:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17032815-0016-0000-0000-00000674A80D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006865; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00839983; UDB=6.00413326; IPR=6.00617887; 
 BA=6.00005245; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014840; XFM=3.00000013;
 UTC=2017-03-28 15:44:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032815-0017-0000-0000-000038861392
Message-Id: <f68f2225-89ac-ab66-9f5b-2895f8f86785@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-28_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703280132
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
X-List-Received-Date: Tue, 28 Mar 2017 15:44:33 -0000

As part of issue 1178, I added some new services to allow users to put 
the system into a mode that the cronus tool can run.

Here's the summary:

systemctl start obmc-power-chassis-on@0.target

     * Just power on a system and not start the SBE


systemctl stop host-failure-reboots@0.service

     * Turns off automatic reboots on checkstops and watchdog timeouts, 
though the BMC will still go to quiesced state.

     * Reboots get enabled again on a BMC reset

     * Can also enable again by starting the service


systemctl start fsi-disable.service

     * Unbinds the FSI driver, and switches the GPIOs for external 
cronus use

     * Do this any time after power on

     * Will need to do this each power on, as the act of powering on 
requires FSI for the VCS workaround


systemctl start fsi-enable.service

     *  Loads the BMC's FSI Driver again

     * A power cycle will also load the drivers


Outstanding issues:

     *  #1397: Switch back to synchronous FSI clocks after unbinding the 
FSI driver

     * #1396:  For Zaius, some services need to be moved under the 
obmc-power-chassis-on@0.target target
