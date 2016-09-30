Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x22f.google.com (mail-ua0-x22f.google.com
 [IPv6:2607:f8b0:400c:c08::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slZ6b2cBczDvJj
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 11:46:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=qSSBXfm9; 
 dkim-atps=neutral
Received: by mail-ua0-x22f.google.com with SMTP id q42so82065426uaq.2
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 18:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8uMz2KOY+vGPCc/0O0X3RN0w0cDtjIJWHZonfF0PNF0=;
 b=qSSBXfm9Sa9IBeWj6q2beUpzSMAN0EiK7v5WWAt97PWdh2EUtrMi//yX5dFK7VV7PE
 5TUfHEFTVtueUsIAajZ8ycPB7XmHdCnzx8YRW0v54snjj49buCQST/xbt9ockUzcG9XF
 1jnpOycpokLQ2N2VbIMjE6mOMgp13LOdL38YDJz06NWKRL3BNa7YxLiv+2HBC1S7SGrq
 CtgYKWeF31GZ+D6OPEDjTXXoBte0ebr/IIvTLkGwo/34C83u9VSCq3JinwpQ/wItepWk
 txGdytcPn7qBwni4/hhSxzLJtqd4mPPSjbY4pOF3LJVCtCldZ+p4MgxVkCWnxtT7giwQ
 dTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8uMz2KOY+vGPCc/0O0X3RN0w0cDtjIJWHZonfF0PNF0=;
 b=OvBiNXsMIK6fOmRYYaGGoFNEcG2+co17jmOhjxPfWZbcK8Ji2ROH8L0SfA1YCdwqoz
 ymZ/WGaVqLMWn3cw0Ik6tnYLU4Sn9QjKT39gxj4g2XmHmaWdc72J5CysJ8D7SrbUpKAs
 4eSRyxRR9JomZ1cHqRpffScddz8SwrXTJrwsdHH0rF2tL1ASwxciTe8AoCdqbF0OrTWr
 KPCmnWUOSgKSUzAweIdSp5Jl8hiPAEpDdtmkBGxbhBppWTa3JTbnWAa+iwMvWm5R+uy4
 nchJ/ImPGftEUidzc5Zm6jKFFyU/HsdObcKYPhyJzPBQNrI79UgoMCtP94pRfKnyMzSL
 LVRA==
X-Gm-Message-State: AA6/9RmOPdYlNZHFyMoZExe5oyW/0a6rOlJ/GzhlhV1iEmIhyq7LSMXrfgomM21FegHw6xc3CqUk/hZP2d79tw==
X-Received: by 10.176.81.56 with SMTP id e53mr1786150uaa.160.1475199989092;
 Thu, 29 Sep 2016 18:46:29 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Thu, 29 Sep 2016 18:46:08 -0700 (PDT)
In-Reply-To: <20160930013816.GC7390@heinlein.lan>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
 <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
 <20160930013816.GC7390@heinlein.lan>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 30 Sep 2016 11:16:08 +0930
X-Google-Sender-Auth: B1BoCQbSxWUBNsf2xRiNJdLgfXM
Message-ID: <CACPK8Xd3vP0E14-QSnpKxcLYdnaf=eqZb3hvfm26QCEZCA3aiA@mail.gmail.com>
Subject: Re: openpower.xyz updates
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 30 Sep 2016 01:46:31 -0000

On Fri, Sep 30, 2016 at 11:08 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Fri, Sep 30, 2016 at 10:37:42AM +0930, Joel Stanley wrote:
>> On Wed, Sep 28, 2016 at 10:08 PM, Andrew Geissler <geissonator@gmail.com> wrote:
>> > Hey Joel, late yesterday afternoon Patrick reported that the gerrit CI
>> > jobs were not triggering.  I took a look and found that our job that
>> > does ID validation (which triggers on patch set creation) was still
>> > working fine but the follow up job that would trigger on the
>> > "Ok-To-Test" comment was no longer triggering.
>>
>> I noticed that many of the gerrit reviews I have pending do not have
>> the OOT or Verified checked. Is the system still having issues?
>
> Currently, the only testing is done on the openbmc/openbmc repository.
> According to this query they are all set with both OTT and V.
>
> https://gerrit.openbmc-project.xyz/#/q/project:openbmc/openbmc+status:open

Okay. Do we plan to test the individual projects as part of an
openbmc/openbmc build in the future?

Cheers,

Joel
