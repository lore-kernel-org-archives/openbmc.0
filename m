Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syNPl0l9mzDt8w
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 03:07:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WOSKecKT; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id i127so12680586oia.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZL4ItTXXo5wkHpzYYQiafWl5XoRXCuYPznbLV0TF2bQ=;
 b=WOSKecKTlztvPTZpdwFHlcyKe/2vnN+PTAb7/Pqrn8pE/TDKzeqw/KEVVJqgmnnoln
 cHfTTTqG0VvDUvl96vu2RCMnCMl3zabM6PEGqonApmgMlQ+JBRFibfDB3XzIsA6q6gKy
 e5FYijlu4AQ+sYsfFWOtEXt4fVvwcDMADWFIbNDk/+AlvyG/SfSt9zTaVA+2H7Q+KSK0
 y8Y4ziFBxQ51xOUwT0pDeNowlwHtm1qEJZfDYrntdSqQ3TMcSoexOKILU2kCSAhuafM8
 TD22nzpKswimirVq2BfgHUzwN9xVswU9wupkUdf3U6gQuqd+31qZOiJ3bELyQq+uG3uD
 j1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZL4ItTXXo5wkHpzYYQiafWl5XoRXCuYPznbLV0TF2bQ=;
 b=cMUtphkg/HpNgjGIBxY9ag3DU+8KoQ0yulDn2oDWUnx6vizIm2WKkzbcilavSPasyS
 8RVToBSfAZWLxtNF8eXAvheU5ZTa0WXSUNytsa54M0dDCp6JTAKgWJ1yYR16LcTxD1ZE
 H4eGOPG/3MXNWElfQCf2/5VuQ1EmKOtYE1/BYvzte+dghTwr//TP31faCpm6V3yfgWhy
 Ny3myzxN0ljvW4d3TZOByXDFK5XZUZAO6XoIZ8KQ6WmT8IOr5D7lpdCFKZl0ksCjdk9y
 +Yx2ClhBos2yBQRYgvNjnWetQLAG+wm00/Eun5nlj9tPpJsoh9Ig89PzlLYtd/u8f/wr
 rSwA==
X-Gm-Message-State: AA6/9RmOgH25Mi6qqUF/b929YWpGSO6COUSmaPpx0ahyGOOZW3C0opmPVlL9LmrutvswDZQyV65D/cmqgqGnpg==
X-Received: by 10.202.117.66 with SMTP id q63mr15910071oic.185.1476720425401; 
 Mon, 17 Oct 2016 09:07:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Mon, 17 Oct 2016 09:07:04 -0700 (PDT)
In-Reply-To: <CACPK8XdRuubGTBzv6oOaxQhuAfXDbn=qvxCWZYO86Aw1P7AXSA@mail.gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
 <CACPK8XdRuubGTBzv6oOaxQhuAfXDbn=qvxCWZYO86Aw1P7AXSA@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 17 Oct 2016 11:07:04 -0500
Message-ID: <CAA0LjjVo+cAoZe4hFgvPV+hkRE6Gn8Q9EWYhryLOjzJMU+yP5A@mail.gmail.com>
Subject: Re: [PATCH linux v4 00/20] FSI device driver introduction
To: Joel Stanley <joel@jms.id.au>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 xxpetri@de.ibm.com, 
 zahrens@us.ibm.com, Stewart Smith <stewart@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 16:07:07 -0000

On Mon, Oct 17, 2016 at 5:18 AM, Joel Stanley <joel@jms.id.au> wrote:
> Hey Chris,
>
> On Mon, Oct 17, 2016 at 5:58 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
>> Overall, this series is getting to look much better - I'd say we're in
>> good shape for upstream submission soon.
>
> I second this! You and Jeremy have made some good progress this past
> week or two. Great work from both of you.
>
> I came the OpenFSI spec[1] on the OpenPower Foundation website the
> other day. I suggest you include a reference to it in your commit
> message and cover letter so others can use it as a reference.
>
> The fact that it's publicly available is particularly useful when
> making the upstream submission, as it allows others to check our
> implementation against a public specification.
>
> [1] http://openpowerfoundation.org/wp-content/uploads/resources/OpenFSI-spec/content/ch_preface.html
>

Hi Joel,

Sure, will add that.

Thanks,
Chris

> Cheers,
>
> Joel
