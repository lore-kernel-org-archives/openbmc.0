Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sfTFP6kNlzDsgj
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 04:49:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=odqxbLd7; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id a62so4506617oib.1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 11:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=sK2JRnqBbx1irOe4U0I3+gU1RTg4JS173h3T7lWI4JI=;
 b=odqxbLd71w5CieiD4Bbr3MbViMa73XHuukQnNisWN55bipYFYByGbu6WOcEBGo0Gnx
 SUO4OJ4qLeh4TejMGRWf43hpYKaIbNNj6WzioODtNUp5EJLhiAqrTRq/11Ip1jn8cDs0
 QJSQHeaB/1fM22QzPnO0JR9V+3bIZ2vKdn8sI7Bgzsh0AFP7JzoDSgFuTAGZWKECb2cr
 YJhGKyswBPTPikqxQBSs6yksRmkiByWgNYXKouwqP7pnOStM7vXRH0MY2qu+kLldRzNY
 a+HA3N3em+nkTVU0+UMGQQlV2uDFwN8GzglB998Dv9yJ0hS3d3Lx3aEAZGYrf8xUtrlq
 Y/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=sK2JRnqBbx1irOe4U0I3+gU1RTg4JS173h3T7lWI4JI=;
 b=L1rqsWT6hUkFK91gUh75Wjo/q+1XvIW66rPtdJuwN4vA62oESECDPS+hO6wCfkj2c3
 QBiz2kAVQnvEs9vuvQPFMDUCXhhmT3A8PSwIGUtf8ZThbDSPVjCQRHddC22dxIoaq6Qi
 RuaiGlqZCSMZuc/A7MY9YkkY5U7id5MLTuSFfRUTWxA3sK6I7S4h2XVLErcntfyxdg8g
 Ye0ZVigy4yeKH3T74fwWjwEPlIFH8hU4cL8ijLiISVkHTug+qdFoyTLrG6K+n1pJPp9p
 BwRmnzuGrnGDnU7SAXZYS5mdB0wr6Zaqqc/f8fa9M0uqnQcHfhXkjt/kB1BWtCnSaojo
 zDXg==
X-Gm-Message-State: AE9vXwPjN6S6tGH1ItJPVh4Tq4mstqogl/u5rv5yqVIxqwvcWtUqEM8oPj4GvjGQWyNWFRrWHSXrZsgfZaof3A==
X-Received: by 10.202.95.130 with SMTP id t124mr4687073oib.159.1474483784208; 
 Wed, 21 Sep 2016 11:49:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.218.85 with HTTP; Wed, 21 Sep 2016 11:49:43 -0700 (PDT)
In-Reply-To: <CACPK8Xe7LOX-kK5KbRNNdRC7RkbTZinsor-7pP9aubnUhanjjQ@mail.gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XfTS+jyVGFRXZxPb4MQD3rzbFXmjQbqFn5c=aq+HopqkQ@mail.gmail.com>
 <CACPK8Xe7LOX-kK5KbRNNdRC7RkbTZinsor-7pP9aubnUhanjjQ@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 21 Sep 2016 13:49:43 -0500
Message-ID: <CAA0LjjX=MrRGRWRrmR6_Fyisx4tjGs+Nn6dWdgyCE5TVLA982w@mail.gmail.com>
Subject: Re: [PATCH linux v5 0/7] Introducing the FSI device driver
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Wed, 21 Sep 2016 18:49:46 -0000

On Wed, Sep 7, 2016 at 7:10 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Chris,
>
> On Fri, Sep 2, 2016 at 2:35 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Hi Chris,
>>
>> On Thu, Aug 25, 2016 at 5:24 AM,  <christopher.lee.bostic@gmail.com> wrote:
>>> From: Chris Bostic <cbostic@us.ibm.com>
>>>
>>> Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
>>> driver. FSI is a high fan out serial bus consisting of a clock and a serial
>>> data line capable of running at speeds up to 166 MHz.
>>
>
> I've taken a look at the patches. There doesn't seem to be much
> improvement over the last version.

Not sure I follow what you mean by improvement.  There is more
function added with this last set.  In terms of incorporating Jeremy's
changes I will attempt to follow his suggestions but I'm a little
unclear if you are expecting those to be done verbatim as per his
example.   The patches are rather small and so to incorporate ~ 5
KLOCs would require an enormous patch set or series of sets.

I've been working on the next set and will get that to you soon.  I
don't, however, want to send another set without much improvement so
let me know how I can do this.

>
>> I was wondering if you have had a look at Jeremy's implementation yet?
>> If so, are there any ideas you have incorporated into your series?
>
> I recommend you consider these questions and get back to me.
>
> Cheers,
>
> Joel
