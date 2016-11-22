Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tN5fZ1YNjzDvkT
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 11:18:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="wLYobzew"; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 20so228251uak.0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 16:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lpE0u42fq4NoXy14Tbob920MZDjp8SZtFVWO0X2VT8U=;
 b=wLYobzewQOQWpe9eJX/oiWRYInLwlkM/B+A54O9LdQ8aeCQPcQF2J7PvrfcZbw5ySv
 2oXBVLfJ8uyO873YiNjsZSDWGEFrMhwtQi0bYikp/mSHIY/RtY+hma+f+7QYfNGzHz2e
 OMzlpkKzXI9IVX/KswlZWH4XvsQT35YjjZXlshZx/YLxahCUg0AmhZ+4y6qJQZgCUIAQ
 OlR0UG6AMR/8nyhXdxwylHvLf0twrefSyUpJJ+R3IwetB7yWHPLXSn8yWDe/O683D4dL
 6m1MCUkUTtljrTBUvZ4FnuwWA8kqjL8MYV+cFBsh+xz8ET/RIMe4isbNnXpx7fGXSCJY
 xK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lpE0u42fq4NoXy14Tbob920MZDjp8SZtFVWO0X2VT8U=;
 b=VlKeUni5MKY1/GO3JlvSOPGSUkvC6ndvlu2go8eD5FFJ3eTAk+wB0R+ksgnKiD9hZn
 r5Orobn/DtA4us59mvE6KUE0N2yA007NbhV+JPW9cz2KJr+7Br1LlMSMP3f69aFnqwzV
 ta7Tohjr13bKjxbNT1eK003bPkHsbcXkbI4ppHZ1WE1Q/tD/zLjsvaKXFLR0CTyXIhIk
 Oeb5OFdfvzJZ+YSIwrR1LMHZDBXFJ/JpuPn+nf7uH8lcb0z1RE1D+03l6RjmMvFHkPMF
 qmaxHf+Coa3zqQ88zIhFZ5J4EOoPRA8NbpEYqp1bd68XuYvWtmOBblPr/4+zHX9F8OoC
 qeFg==
X-Gm-Message-State: AKaTC01dhCP9vAQCsN+CAuii+PX2x2lWkVGt3PVqEtkQWpkbC2XKZI8xvId33zGu9PWkRRxNot8DIKTm54jBlA==
X-Received: by 10.159.34.41 with SMTP id 38mr9276596uad.160.1479773907491;
 Mon, 21 Nov 2016 16:18:27 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.0.193 with HTTP; Mon, 21 Nov 2016 16:18:07 -0800 (PST)
In-Reply-To: <CAA0LjjVH3BEtu7et_2VtpLXgbrHOfRTNvpQFL8c0Eh-kdDLH_Q@mail.gmail.com>
References: <OF6A1A7417.88F14B99-ON0025806F.004E9A7D-8625806F.004EA327@notes.na.collabserv.com>
 <CAA0LjjXej1XQ=voNfX_=5YL21bgjf73WK-UE=OgBcb=Pt=aKhg@mail.gmail.com>
 <1479707274.5215.19.camel@aj.id.au>
 <CAA0LjjVH3BEtu7et_2VtpLXgbrHOfRTNvpQFL8c0Eh-kdDLH_Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Nov 2016 10:48:07 +1030
X-Google-Sender-Auth: Gcc5_Y0YxHroHhHa4wH-VReUSmo
Message-ID: <CACPK8XcmXQWrpxPK-=qhAxKFB++TgBPGWrLtiLJ1m4_y-fhcbw@mail.gmail.com>
Subject: Re: Fw: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Jeremy Kerr <jk@ozlabs.org>, xxpetri@de.ibm.com, zahrens@us.ibm.com
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
X-List-Received-Date: Tue, 22 Nov 2016 00:18:30 -0000

On Tue, Nov 22, 2016 at 5:25 AM, Christopher Bostic
<christopher.lee.bostic@gmail.com> wrote:
>> Have you been testing on a Palmetto using an OpenBMC build? If so the
>> request should still fail as the patch is applied in the OpenBMC kernel
>> build. All I'm proposing here is we move it from OpenBMC into the
>> Aspeed kernel tree.
>
> Yes I have been testing on Palmetto using OpenBMC builds.  The H6
> pin reports as busy when I request it so for now I have a workaround
> to bypass the gpio interface.  All the other pins I grab via the normal
> dts gpio devm_gpio_get interfaces.   Once the H6 hog can be removed,
> assuming no other code needs it, I can remove my workaround in
> the OpenFSI code.

I suggest you add a patch to your tree that removes the hog from the
palmetto dts file. Now that we have a driver that owns the hardware
the hog can be removed.

Cheers,

Joel
