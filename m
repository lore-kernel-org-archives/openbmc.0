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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q1Pp6GdmzDqQq
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 06:30:00 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9AJOKol111686; Thu, 10 Oct 2019 15:29:55 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vj9ft2g5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2019 15:29:55 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9AJOqvX029932;
 Thu, 10 Oct 2019 19:29:54 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 2vejt80e0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2019 19:29:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9AJTrTx53739956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 19:29:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A518AC05B;
 Thu, 10 Oct 2019 19:29:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C4EEAC059;
 Thu, 10 Oct 2019 19:29:53 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 10 Oct 2019 19:29:52 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 10 Oct 2019 14:30:04 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>, "Hawrylewicz Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@intel.com>, openbmc@lists.ozlabs.org
Subject: Re: Virtual Media
In-Reply-To: <53D123781965AE42A2ABEE982B242E41A10E3D21@IRSMSX102.ger.corp.intel.com>
References: <53D123781965AE42A2ABEE982B242E41A10E3D21@IRSMSX102.ger.corp.intel.com>
Message-ID: <c87bcee49e5311c0a226816a1d98023e@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=938 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910100163
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
X-List-Received-Date: Thu, 10 Oct 2019 19:30:07 -0000

Hi Pawel,


> We're currently in the middle of Virtual Media implementation based on
> design:
> https://github.com/openbmc/docs/blob/master/designs/VirtualMedia.md
> [1]
> 
> There are few patches in review to bmcweb which enables feature as
> above. There are few minor differences which made it not 100%
> compatible with
> 
> yours (i.e. different endpoints), on the other hand it has some
> benefits, like support for Redfish Virtual Media.

Great, agree, the project direction is to move to Redfish.

> 
> As It's reasonable not to support two different implementations of
> same functionality, I'd like to ask you to review those patches,
> 
> and see if we can agree to have one common implementation in bmcweb.

I support the Redfish implementation, let's just make sure that the web 
UI
transitions to the new Virtual Media implementation before deprecating
any existing endpoints.

As for the bmcweb changes, I'm not really an expert there so will defer 
to
the maintainers on approving how it's implemented.
