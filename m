Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tk3kk71jqzDwXr
 for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2016 16:54:22 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uBL5sHgR125275
 for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2016 00:54:20 -0500
Received: from e28smtp06.in.ibm.com (e28smtp06.in.ibm.com [125.16.236.6])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27fewt1by4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2016 00:54:19 -0500
Received: from localhost
 by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 21 Dec 2016 11:23:40 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp06.in.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 21 Dec 2016 11:23:38 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id 912C9394004E
 for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2016 11:23:37 +0530 (IST)
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uBL5rbAG30081184
 for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2016 11:23:37 +0530
Received: from d28av02.in.ibm.com (localhost [127.0.0.1])
 by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uBL5ra4e019230
 for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2016 11:23:36 +0530
Received: from [9.79.201.87] ([9.79.201.87])
 by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uBL5raNu019218; Wed, 21 Dec 2016 11:23:36 +0530
Subject: Re: Why OpenBMC not ready for production?
To: =?UTF-8?B?0JjQu9GM0Y8g0JrRg9C30L3QtdGG0L7Qsg==?= <ilya@yadro.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20161220203029.arqocnjnpdtan4bt@yadro.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Wed, 21 Dec 2016 11:23:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161220203029.arqocnjnpdtan4bt@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16122105-0020-0000-0000-000000868339
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16122105-0021-0000-0000-000001D94100
Message-Id: <3ce47c1e-ede3-8887-77b7-e4f8c96a33ac@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-21_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1612210098
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
X-List-Received-Date: Wed, 21 Dec 2016 05:54:23 -0000

hello,

I answered in-line.

On 12/21/2016 02:00 AM, Илья Кузнецов wrote:
> Hello,
> Could you please advice if there are any architectural problem in 
> OpenBMC design or current implementation issues which do not allow use 
> it in end-customer environment?
I am not quite sure I understand the question. Rackspace is using 
OpenBMC stack on their Barreleye box.

http://blog.rackspace.com/now-get-your-own-barreleye
> What significant efforts should be applied to get it ready? It is 
> rather rhetorical question, but still I would like to hear opinion of 
> development team.

Does my answer above help clarify ?. If not, could you explain the 
requirements and the environment that you want to target ?
> I apologize if here is not well place for asking such kind of 
> question. If so, please let me know where to start discussion?
> Thank you in advance!
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
