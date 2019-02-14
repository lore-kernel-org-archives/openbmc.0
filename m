Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440qCc69F7zDqWF
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 08:24:28 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1ELO2Jc090413
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 16:24:25 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qnekhg3gj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 16:24:25 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Thu, 14 Feb 2019 21:24:24 -0000
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Feb 2019 21:24:22 -0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1ELOLdd26214624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Feb 2019 21:24:21 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41E9BC6055;
 Thu, 14 Feb 2019 21:24:21 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15FB0C6059;
 Thu, 14 Feb 2019 21:24:21 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Feb 2019 21:24:21 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 14 Feb 2019 15:31:11 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Subject: Re: Romulus to use Virtual PNOR
In-Reply-To: <CALLMt=q_Pb=TpzR353dTMyP=cpkf9FPJCFiSxu+Q3_ntK5no2Q@mail.gmail.com>
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
 <CACPK8Xd-OX_zQtn5rtfRw+rXB+783hQSwc_PTmzMYr=SHaP5Tg@mail.gmail.com>
 <CAARXrtnjhLDez0vjXOxMGgNeNXPTZCBZZBa6Kk+U9=tkRJoKgg@mail.gmail.com>
 <CALLMt=q_Pb=TpzR353dTMyP=cpkf9FPJCFiSxu+Q3_ntK5no2Q@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19021421-0016-0000-0000-000009841A74
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010596; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000280; SDB=6.01161099; UDB=6.00606058; IPR=6.00941656; 
 MB=3.00025585; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-14 21:24:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021421-0017-0000-0000-00004226BD8F
Message-Id: <c8633af8ba717f0812cf55b8eb458084@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-14_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=722 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902140141
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
X-List-Received-Date: Thu, 14 Feb 2019 21:24:29 -0000

On 2019-02-14 07:13, Andrew Geissler wrote:
> On Wed, Feb 13, 2019 at 9:03 PM Lei YU <mine260309@gmail.com> wrote:
>> 
>> Based on the discussion, let's keep using static flash layout for PNOR 
>> on
>> Romulus.
>> 
>> This brings the questions:
>> 1. Shall we move the legacy code update service
>>    (org.openbmc.control.Flash.service) to the new one
>>    (xyz.openbmc_project.Software.xxx.service)?
> 
> Yes please. I asked Adriana to open a story to track doing this.

https://github.com/ibm-openbmc/dev/issues/417

The first step would be to support just updating the pnor using the
libflash library that the legacy code uses. We can look into the
other features like signature validation afterwards.
