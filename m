Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x233.google.com (mail-ua0-x233.google.com
 [IPv6:2607:f8b0:400c:c08::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sss7H6K6GzDrL1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 18:23:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Sq4NB3+5; 
 dkim-atps=neutral
Received: by mail-ua0-x233.google.com with SMTP id p102so81029533uap.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 00:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=BHRh+U4u2xkZmJN+0k1JyHSMrrihtYlKmzQ3As3mPrA=;
 b=Sq4NB3+5fguaQqOJshUtrCdfxyAhnXtBqEvjOHgaBIDhBpu7YMbn/pivTKowUegIrO
 8IGVOCG7zDMr6aw4jCtdYO1O2BhAhOYMncXitgCEIRlAEVO4zf0l2D6usMrPdk8UKn83
 Zd5gVgSRTNHXiCaMwYI79tbaHErdMEoilAWV+9XyWYqlEgt8g/KhykkokF01V7ig+Pc5
 v/VAUwrsKxQiBFn2sM+bbvCAkxlCplf6UJ7IHR34KacpkbW7YYk+jE+CN9TrKC23170J
 Ws9D3k7ieqFESyif77XyRx0OajQP4RITm3UiRg4hgT1un6Uy/gtzPk4hKZtsLjY3ZzaY
 2F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=BHRh+U4u2xkZmJN+0k1JyHSMrrihtYlKmzQ3As3mPrA=;
 b=YMgaCNAK7uGWjHaIOOZWYVco+GJVU3RZfFm7QM3xkQ5ZCX1qpGktXiCSMGdaSI7zjj
 Xhk6eLzsFg8C74dstji+EHuFTwhCmgvucWDCcFNMLi6/jSaleSZRiM19CE2CAooiafla
 TrMDyI1E4s3fwTjhsX/0WfMNzOMlBYIE0SXjD2fWY8/SQDsmw5Pp8j+KL9g+AD+dTO8a
 DLQn0Ts1XcllkbHVaZatERKIgiR33bmQhxtm4nOUCRBhd9oTf4gl1ngbTFm3KFRvgXxs
 R2A1cqJj8VMkyZP6YAO0VIYbacGKGnH/IZbxFwlXOiSZFHnEhtxb8Ucp8xMlTywTQoz+
 ZDPg==
X-Gm-Message-State: AA6/9Rn3SSl++KgwUq+CfSkWn9pxkVab1dECfdYP/bL8XzDH/NDseb9EtlKFd6kaPLxqK29wn10M0+ZW3/3hSQ==
X-Received: by 10.176.67.166 with SMTP id l35mr3945436ual.166.1476084230708;
 Mon, 10 Oct 2016 00:23:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 10 Oct 2016 00:23:30 -0700 (PDT)
In-Reply-To: <20161004112517.GA27235@gwshan>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <20161004003626.GA309@gwshan>
 <CACPK8Xcx7vNOsT6rdLYVJQHwvN6yFyrogOhpPyczU1jMQ8r2rw@mail.gmail.com>
 <20161004112517.GA27235@gwshan>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 18:23:30 +1100
X-Google-Sender-Auth: uf5D7UuQe9KjqKbxtDDJVDPpC-8
Message-ID: <CACPK8XfqgxbqWyMQtnm1gQ665zqvZFz=5ZmC4y0RQ2ra8E=s9g@mail.gmail.com>
Subject: Re: [PATCH v2 4.7 0/8] NCSI Fixes
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 10 Oct 2016 07:23:56 -0000

On Tue, Oct 4, 2016 at 10:25 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> On Tue, Oct 04, 2016 at 03:58:58PM +1030, Joel Stanley wrote:
>>On Tue, Oct 4, 2016 at 11:06 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>>> On Thu, Sep 29, 2016 at 11:38:43AM +1000, Gavin Shan wrote:
>>>>
>>>
>>> Joel, please hold merging this series because I try pushing this series
>>> upstream firstly. It's always good to keep code sync'ed between 4.7.x
>>> with upstream regarding NCSI stack. I will post a updated version if
>>> it can be upstream in time. Thanks again for your review and comments.
>>
>>Okay, will do. Thanks Gavin.
>>
>
> Thanks, Joel. v3, merged to linux.net ("next" branch), was just posted.
> Please consider merging it to 4.7 branch :)

These should be all part of the 4.7 branch now. Please let me know if
I've missed anything.

Cheers,

Joel
