Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vchSF1y63zDqY1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 14:08:28 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2733WdZ012130
 for <openbmc@lists.ozlabs.org>; Mon, 6 Mar 2017 22:08:19 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2917gnvmu2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 Mar 2017 22:08:19 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 6 Mar 2017 20:08:18 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 6 Mar 2017 20:08:15 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id AE4453E40041;
 Mon,  6 Mar 2017 20:08:14 -0700 (MST)
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2738Atb16515578; Mon, 6 Mar 2017 20:08:14 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BD2C6E048;
 Mon,  6 Mar 2017 20:08:14 -0700 (MST)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.5.17])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 9CF336E03F;
 Mon,  6 Mar 2017 20:08:12 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Remove hub devices during
 master unregister
To: Joel Stanley <joel@jms.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Patrick Williams <patrick@stwcx.xyz>
References: <20170307005551.33957-1-cbostic@linux.vnet.ibm.com>
 <CACPK8Xe6nNEw4gYBmChq9eJ38PBa4ft-Ytc7tF51Bru2XnTLwQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 6 Mar 2017 21:08:10 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe6nNEw4gYBmChq9eJ38PBa4ft-Ytc7tF51Bru2XnTLwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17030703-0016-0000-0000-0000065E2FB3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006736; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00831018; UDB=6.00407670; IPR=6.00608609; 
 BA=6.00005190; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014535; XFM=3.00000012;
 UTC=2017-03-07 03:08:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030703-0017-0000-0000-000037FE9906
Message-Id: <e246ab83-4459-c471-c059-d94f21b65b79@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-07_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703070023
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
X-List-Received-Date: Tue, 07 Mar 2017 03:08:29 -0000



On 3/6/17 8:37 PM, Joel Stanley wrote:
> On Tue, Mar 7, 2017 at 11:25 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> +static int fsi_unregister_hubs(struct device *dev, void *data)
>> +{
>> +       struct fsi_master_hub *hub =
>> +                               (struct fsi_master_hub *)dev_get_drvdata(dev);
>> +
>> +       if (!hub)
>> +               return 0;
>> +
>> +       device_del(dev);
>> +       fsi_master_unscan(&hub->master);
>> +}
> This introduces a warning:
>
> drivers/fsi/fsi-core.c: In function ‘fsi_unregister_hubs’:
> drivers/fsi/fsi-core.c:754:1: warning: control reaches end of non-void
> function [-Wreturn-type]
>   }
>   ^
>
> Did you build test this patch?
I did build but didn't see the warning. Wasn't looking close enough 
apparently -will correct.

> Have you boot tested it?

I did boot it.
> What runtime testing did you perform?
I ran multiple scans without rebooting to verify the removal and 
creation of sysfs files was done properly.
Also verified no further sysfs warnings attempting to create duplicate 
file names.



> Cheers,
>
> Joel
>
