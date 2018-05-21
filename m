Return-Path: <npiggin@au1.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=npiggin@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qQWS19LszF18k
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 03:19:47 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4LG3kax029540
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 12:04:42 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j3yxbcm54-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 12:04:38 -0400
Received: from localhost
 by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <npiggin@au1.ibm.com>;
 Mon, 21 May 2018 17:04:11 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 21 May 2018 17:04:09 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4LG49so17301764; Mon, 21 May 2018 16:04:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98F0B4203F;
 Mon, 21 May 2018 16:54:53 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3B0642042;
 Mon, 21 May 2018 16:54:52 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 May 2018 16:54:52 +0100 (BST)
Received: from roar.ozlabs.ibm.com (unknown [9.192.203.183])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3E4CCA0193;
 Tue, 22 May 2018 02:04:06 +1000 (AEST)
Date: Tue, 22 May 2018 02:04:00 +1000
From: Nicholas Piggin <npiggin@au1.ibm.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 linux dev-4.13 2/3] fsi/sbefifo: Add driver for the
 SBE FIFO
In-Reply-To: <85b59d57c40db1b69101ca2bb295d8203a6223a3.camel@kernel.crashing.org>
References: <20180518013429.17732-1-benh@kernel.crashing.org>
 <20180518013429.17732-2-benh@kernel.crashing.org>
 <1526874415.2620050.1378895248.510458F0@webmail.messagingengine.com>
 <85b59d57c40db1b69101ca2bb295d8203a6223a3.camel@kernel.crashing.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 18052116-0040-0000-0000-0000043C3153
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052116-0041-0000-0000-0000264160A4
Message-Id: <20180522020400.3e62d2c1@roar.ozlabs.ibm.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805210191
X-Mailman-Approved-At: Tue, 22 May 2018 12:17:14 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2018 17:19:48 -0000

On Mon, 21 May 2018 18:30:40 +1000
Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:

> +Nick (see question about iovec)
> 
> > > --- /dev/null
> > > +++ b/drivers/fsi/fsi-sbefifo.c
> > > @@ -0,0 +1,867 @@
> > > +/*
> > > + * Copyright (C) IBM Corporation 2017
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > + * it under the terms of the GNU General Public License version 2 as
> > > + * published by the Free Software Foundation.
> > > + *
> > > + * This program is distributed in the hope that it will be useful,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + * GNU General Public License for more details.
> > > + */  
> > 
> > Should be SPDX-style?  
> 
> Yup, keep forgetting about that new thing :)
> 
> > >   
> 
>  .../...
> 
> > > +static int sbefifo_get_sbe_state(struct sbefifo *sbefifo)  
> > 
> > This isn't so much getting the state as ensuring it's in a usable
> > state, or it's conflating error codes with the SBE state. Maybe
> > sbefifo_is_ready()?  
> 
> Hrm... I would expect something called is_something() to return a
> boolean, while here I have 3 different result codes as I want to
> differenciate busy. I'm also adding some more in the next version
> to extract the bit indicating that an SBE async FFDC is present.
> 
> So what about calling it sbefifo_check_sbe_state() instead ?
> 
> IE. It's not a "getter" .. 
> 
>   .../...
> 
> > > +/**
> > > + * sbefifo_submit() - Submit and SBE fifo command and receive response
> > > + * @dev: The sbefifo device
> > > + * @command: The raw command data
> > > + * @cmd_len: The command size (in 32-bit words)
> > > + * @response: The output response buffer
> > > + * @resp_len: In: Response buffer size, Out: Response size
> > > + *
> > > + * This will perform the entire operation. If the reponse buffer
> > > + * overflows, returns -EOVERFLOW
> > > + */
> > > +int sbefifo_submit(struct device *dev, const __be32 *command, size_t 
> > > cmd_len,
> > > +		   __be32 *response, size_t *resp_len)
> > > +{
> > > +	struct sbefifo *sbefifo = dev_get_drvdata(dev);
> > > +	mm_segment_t old_fs;
> > > +	int rc;
> > > +
> > > +	if (!dev || !sbefifo)
> > > +		return -ENODEV;
> > > +	if (WARN_ON_ONCE(sbefifo->magic != SBEFIFO_MAGIC))
> > > +		return -ENODEV;
> > > +	if (!resp_len || !command || !response || cmd_len > 
> > > SBEFIFO_MAX_CMD_LEN)
> > > +		return -EINVAL;
> > > +
> > > +	mutex_lock(&sbefifo->lock);
> > > +	old_fs = get_fs();
> > > +	set_fs(KERNEL_DS);
> > > +	rc = __sbefifo_submit(sbefifo, command, cmd_len,
> > > +			      response, resp_len);
> > > +	set_fs(old_fs);  
> > 
> > Can you talk about why the get_fs()/set_fs()/set_fs() sequence is the
> > right way to go here when there's been discussion in the past about
> > removing the whole show?
> > 
> > 

> Interesting, I had missed that conversation/debate, it's an old API but
> I've been around for a long time :-) It used to be the way to do that
> sort of thing.
> 
> The above use is a rather safe since the oops case has been fixed, but
> if it's actively being phased out then I should try to find a different
> way, though sadly nothing will be as simple and efficient as the above.
> 
> Nick, you added some of that iovec stuff, what do you think is the
> right construct here ?

Yeah I don't know that there's strict policy against set_fs now...
anything is a security bug if you write it with security bugs :)
Seems like there's still quite a lot of users of it. I would say
maybe it's okay to use set_fs in this case because it's all contained
in the driver so we're not talking about new interfaces added to the
kernel. Is there any prohibition on adding new users?

> 
> I read from the HW fifo synchronously and currently just put_user() one
> word at a time into the destination buffer, which can be either a user
> address (read() syscall to the driver) or a kernel address (in-kernel
> API).
> 
> The old code just had 2 pointer argument, one kernel pointer and one
> user pointer and would write to which ever was populated, which I
> thought was gross.
> 
> The iovec stuff looks ... complicated for such a simple use case.

It shouldn't be _too_ hard to use. I think for your code just do an
iov_iter_init or iov_iter_kvec with 1 vec depending on whether it's
user or kernel, and pass that iter into __submit and copy_to_iter.

        /* kernel */
        struct kvec iov = {.iov_base = response, .iov_len = resp_len};
        struct iov_iter resp;
        iov_iter_kvec(&resp, WRITE | ITER_KVEC, &iov, 1, rlen);

        /* user */
        struct iovec iov = { .iov_base = buf, .iov_len = rlen};
        struct iov_iter resp;
        iov_iter_init(&resp, WRITE, &iov, 1, rlen);

Thanks,
Nick
