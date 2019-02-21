Return-Path: <gmills@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444gGP19KbzDqNQ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 14:40:12 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1L3cmx8092791
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 22:40:10 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qsf1utswv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 22:40:10 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Thu, 21 Feb 2019 03:40:09 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 21 Feb 2019 03:40:08 -0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1L3e7dO24248394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Feb 2019 03:40:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C5DDAC05B;
 Thu, 21 Feb 2019 03:40:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C66D6AC059;
 Thu, 21 Feb 2019 03:40:04 +0000 (GMT)
Received: from [9.81.193.161] (unknown [9.81.193.161])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Feb 2019 03:40:04 +0000 (GMT)
Subject: Re: Repository for CVE-2019-6260 test tool
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <011d0902-7189-4562-86d3-f50e7f249e12@www.fastmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Date: Wed, 20 Feb 2019 21:40:02 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <011d0902-7189-4562-86d3-f50e7f249e12@www.fastmail.com>
Content-Type: multipart/alternative;
 boundary="------------158E3137E6701B5B40A64209"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19022103-0060-0000-0000-0000030E735E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010635; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01164071; UDB=6.00607859; IPR=6.00944657; 
 MB=3.00025673; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-21 03:40:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022103-0061-0000-0000-0000485EBEE5
Message-Id: <24741baf-40ba-31c9-98e4-f229c4df7323@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-21_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902210026
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
X-List-Received-Date: Thu, 21 Feb 2019 03:40:13 -0000

This is a multi-part message in MIME format.
--------------158E3137E6701B5B40A64209
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/2019 8:42 PM, Andrew Jeffery wrote:

> Can you please create a cve-2019-6260 repository under the OpenBMC github organisation to host the tool?

Why a new cve-2019-6260 repo instead of openbmc-tools?

- Gunnar***
*


--------------158E3137E6701B5B40A64209
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>On 2/20/2019 8:42 PM, Andrew Jeffery wrote:
    </p>
    <blockquote type="cite"
      cite="mid:011d0902-7189-4562-86d3-f50e7f249e12@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">
Can you please create a cve-2019-6260 repository under the OpenBMC github organisation to host the tool?
</pre>
    </blockquote>
    <p><tt>Why a new cve-2019-6260 repo instead of openbmc-tools?</tt><tt><br>
      </tt><tt><br>
      </tt><tt>- Gunnar</tt><tt><strong></strong></tt><strong
        itemprop="name"><span class="zh-repo-header-container"><tt></tt><br>
        </span></strong></p>
  </body>
</html>

--------------158E3137E6701B5B40A64209--
