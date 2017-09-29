Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y3mpk4BrCzDqG2
 for <openbmc@lists.ozlabs.org>; Sat, 30 Sep 2017 08:45:02 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8TMixNO137038
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 18:45:00 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d9vchewvg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 18:45:00 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 29 Sep 2017 16:44:59 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 29 Sep 2017 16:44:57 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8TMiukB2032004; Fri, 29 Sep 2017 15:44:56 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B906C603C;
 Fri, 29 Sep 2017 16:44:56 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.183.77])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id D762DC6037;
 Fri, 29 Sep 2017 16:44:55 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 1/3] drivers/fsi/sbefifo: refactor to
 upstream list state
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506033838-2078-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1506315435.30138.17.camel@aj.id.au> <1506320183.30138.22.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 29 Sep 2017 17:44:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1506320183.30138.22.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17092922-0024-0000-0000-00001745239A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007813; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000233; SDB=6.00924261; UDB=6.00464729; IPR=6.00704399; 
 BA=6.00005613; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017330; XFM=3.00000015;
 UTC=2017-09-29 22:44:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092922-0025-0000-0000-00004CEAACED
Message-Id: <92ba5ba1-77f2-ede6-6e2c-901777902ccd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-29_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709290323
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2017 22:45:03 -0000



On 09/25/2017 01:16 AM, Andrew Jeffery wrote:
> Hi, it's me again.
>
> On Mon, 2017-09-25 at 14:27 +0930, Andrew Jeffery wrote:
>>>   static int sbefifo_remove(struct device *dev)
>>>   {
>>> -     struct fsi_device *fsi_dev = to_fsi_dev(dev);
>>> -     struct sbefifo *sbefifo, *sbefifo_tmp;
>>> +     struct sbefifo *sbefifo = dev_get_drvdata(dev);
>>>        struct sbefifo_xfr *xfr;
>>>   
>>> -     list_for_each_entry_safe(sbefifo, sbefifo_tmp, &sbefifo_fifos, link) {
>>> -             if (sbefifo->fsi_dev != fsi_dev)
>>> -                     continue;
>>> -
>>> -             device_for_each_child(dev, NULL, sbefifo_unregister_child);
>>> +     WRITE_ONCE(sbefifo->rc, -ENODEV);
>>> +     wake_up(&sbefifo->wait);
>>>   
>>> -             misc_deregister(&sbefifo->mdev);
>>> -             list_del(&sbefifo->link);
>>> -             ida_simple_remove(&sbefifo_ida, sbefifo->idx);
>>> +     misc_deregister(&sbefifo->mdev);
> I think we should do this before the wake_up() to ensure that we wake
> all the submitted jobs. Otherwise we might miss some.

Problem is that if the child devices (occ, for example) don't have a 
cancel function, then we would hang waiting for stuff to wake up in 
their remove() functions. So I think we need to set rc and wake_up 
first, then start unregistering clients.

>
>>> +     device_for_each_child(dev, NULL, sbefifo_unregister_child);
>>>   
>>> -             if (del_timer_sync(&sbefifo->poll_timer))
>>> -                     sbefifo_put(sbefifo);
>>> +     ida_simple_remove(&sbefifo_ida, sbefifo->idx);
>>>   
>>> -             spin_lock(&sbefifo->lock);
>>> -             list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
>>> -                     kfree(xfr);
>>> -             spin_unlock(&sbefifo->lock);
>>> +     if (del_timer_sync(&sbefifo->poll_timer))
>>> +             sbefifo_put(sbefifo);
> Shouldn't we be doing this before WRITE_ONCE(sbefifo->rc, -ENODEV) to
> ensure we avoid a race on the value of ->rc? Otherwise the timer could
> fire between the WRITE_ONCE() and here and potentially write ->rc or
> cause another job to hang in the FIFO.

rc is only ever written with error values, fortunately, so I'm not too 
concerned about it.

Thanks,
Eddie
