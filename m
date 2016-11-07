Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCDFc2V3JzDvNC
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 00:44:35 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uA7DiUhV107867
 for <openbmc@lists.ozlabs.org>; Mon, 7 Nov 2016 08:44:33 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 26jngc8npc-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 08:44:32 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Mon, 7 Nov 2016 06:43:58 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 7 Nov 2016 06:43:57 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 772BB3E40041;
 Mon,  7 Nov 2016 06:43:56 -0700 (MST)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uA7Dhu1M22347830; Mon, 7 Nov 2016 06:43:56 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06171C6043;
 Mon,  7 Nov 2016 06:43:55 -0700 (MST)
Received: from [9.193.119.244] (unknown [9.193.119.244])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 444FBC6037;
 Mon,  7 Nov 2016 06:43:54 -0700 (MST)
To: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: tomjose <tomjose@linux.vnet.ibm.com>
Subject: Discussion on IPMI provider libraries
Date: Mon, 7 Nov 2016 19:13:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16110713-8235-0000-0000-0000099013B6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006040; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00777715; UDB=6.00374462; IPR=6.00555028; 
 BA=6.00004861; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013235; XFM=3.00000011;
 UTC=2016-11-07 13:43:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16110713-8236-0000-0000-000036434859
Message-Id: <58208518.50202@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611070254
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
X-List-Received-Date: Mon, 07 Nov 2016 13:44:36 -0000

Hello Brendan,

The discussion is with respect to issue 
https://github.com/openbmc/openbmc/issues/430.

The goal of this issue is to share ipmi provider libraries between 
phosphor-host-ipmid
and phosphor-net-ipmid.

The plan is to provide a framework in net-ipmid to register IPMI 
provider API's.
Every IPMI command has a privilege level which would be compared against 
the session's
privilege level before the command is executed. For supporting IPMI on 
LAN channel,
the privilege for each command need to be assigned.

This is the present signature of the callback command API's.

typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, 
ipmi_request_t,
                                        ipmi_response_t, 
ipmi_data_len_t, ipmi_context_t);

I plan to add additional parameter for the command privilege level. I 
heard you had interest
around this area to modify callback API to suit your specific needs.

Let me know your thoughts.

Regards,
Tom
