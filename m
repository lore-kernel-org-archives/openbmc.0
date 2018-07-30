Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41f8VV3fmpzF0gv
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 16:17:06 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6U6997x060068
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 02:17:03 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2khv5f2717-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 02:17:02 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Mon, 30 Jul 2018 07:17:00 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Jul 2018 07:16:59 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6U6GwI129229234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Jul 2018 06:16:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DE42A4040;
 Mon, 30 Jul 2018 09:17:10 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 414D9A4055;
 Mon, 30 Jul 2018 09:17:09 +0100 (BST)
Received: from [9.202.13.177] (unknown [9.202.13.177])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Jul 2018 09:17:09 +0100 (BST)
To: richard.marian.thomaiyar@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: SSSD flash size and the runtime size
Date: Mon, 30 Jul 2018 11:46:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------11C57B65E249337476620D96"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18073006-0012-0000-0000-00000290CD12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18073006-0013-0000-0000-000020C2C7E9
Message-Id: <d08ad9f8-471f-27f4-4652-28c200dfb254@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=682 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807300071
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2018 06:17:07 -0000

This is a multi-part message in MIME format.
--------------11C57B65E249337476620D96
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

Need the following info regarding the SSSD flash space size.

What is the flash size after including the SSSD and it's dependencies on 
Intel reference platform(s2600wf)?

What is the runtime memory requirement for SSSD and its dependency?

If I look at uncompressed data then alone SSSD(18M) + openLDAP(14M) is 
taking 32M.I haven't added the size of

other dependent recipes(cyrus-sasl libtdb ding-libs etc).Can you please 
share your observation on this?

Regards

Ratan Gupta



--------------11C57B65E249337476620D96
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><tt>Hi Richard,</tt></p>
    <p><tt>Need the following info regarding the SSSD flash space size.</tt></p>
    <p><tt>What is the flash size after including the SSSD and it's
        dependencies on Intel reference platform(s2600wf)?</tt></p>
    <p><tt>What is the runtime memory requirement for SSSD and its
        dependency?</tt></p>
    <p><tt>If I look at uncompressed data then alone SSSD(18M) + openLDAP(14M)
        is taking 32M.I haven't added the size of<br>
      </tt></p>
    <p><tt>other dependent recipes(</tt><tt><span style="color: rgb(69, 69, 69); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">cyrus-sasl libtdb ding-libs etc</span>).Can
        you please share your observation on this?</tt></p>
    <p><tt>Regards</tt></p>
    <p><tt>Ratan Gupta<br>
      </tt></p>
    <br>
  </body>
</html>

--------------11C57B65E249337476620D96--
