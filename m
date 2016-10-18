Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syljQ74R4zDt27
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 17:36:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jeXblggl; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id 130so6762569vkg.2
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 23:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=aufoFgUxtycD+UBSGehmdv8aBikSIgppGu2mCJ6c7Mc=;
 b=jeXblggl9teGl+HNwOUekwYcs1ql/eP40cFTTsQ/aH3HJxehx2iXomUIl0oap/6XYw
 Miay6naLfIqDkFiDJpxNiUuugyb7ErPpQQRNmUAKTVJvN56LSLa962nfMplWTI+SoNcF
 GzwDNC4RsOko0sb7IxANYsSyV1qlqDB6Ys1hJxf/L2n3Cm4VJ8d3SNHV3YsWaHBhA3kp
 ab1Rq6ILU+3OlAKCLxry+Fwm5I9T4w22iDw/OJN9chbsYC7wYLib+9pIJDfRgfaeb8ru
 AjehJ7sDWRunMUWXzGkU7W3IWNDIqXjNuV8YjSZqj/88ZN8mv4knW4cqd6NfF622TYPe
 friw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=aufoFgUxtycD+UBSGehmdv8aBikSIgppGu2mCJ6c7Mc=;
 b=c5EZMP5EHjFXvQm+fhzrs2Cn74HQNxiaNful33bNzWjTIRP/QKJnf+oFGHLvtewl1d
 MDxQSgYWBLsnDUWm/yCai/vbCHLRUbex1s1PIqFEv+6NMASyMl6gWEW+DxdKv6KG7JhI
 dZeogj4qhx4Lj0+QEokrNrCIh1IeI4ehZkatCA70DVeEV6jT5u9Ay8QoNwSbxFqZ+ZI4
 A5PVFT56Vprqh22Ov+DWNLrNQ1cG0SsH9bkpJAl5FIxEmeRDAQM1N1Oi61vWsXBFG5Gn
 aOSk59sdtPazGUDEvWvBbHHIcUCLFNBStb0wJvnAfQvE/kFoXSBx+TcqzpTNMDDkNrkh
 wr/A==
X-Gm-Message-State: AA6/9RngXUZZ8o7YpLT/xzDTumJwRIW0AkxnW+r28/LHYpuo6LbiIUDiOeoG3TUSE4xZwBVFRlaJRqWNQj2Bfg==
X-Received: by 10.31.129.194 with SMTP id c185mr892006vkd.67.1476772615304;
 Mon, 17 Oct 2016 23:36:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 17 Oct 2016 23:36:34 -0700 (PDT)
In-Reply-To: <CAFR_W8qd0fOztUqzed=WMXc4KLsMbo3pnb9JYPezQrLV_YeW7g@mail.gmail.com>
References: <1474998214-12720-2-git-send-email-maxims@google.com>
 <1475184427-144121-1-git-send-email-maxims@google.com>
 <1475184427-144121-2-git-send-email-maxims@google.com>
 <CACPK8XfS3kY3PHK7r+aiGQ+5FXe8Wrs2p-FYr=_f58JrCRiQfg@mail.gmail.com>
 <CAFR_W8qd0fOztUqzed=WMXc4KLsMbo3pnb9JYPezQrLV_YeW7g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 Oct 2016 17:06:34 +1030
X-Google-Sender-Auth: MG970s3JgwiHLTHsaN7-lwgshz8
Message-ID: <CACPK8Xfgr+i_pY7vyH+NV=A2jbCPU77YRWdP-HREnfG8ufTzBw@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed: Fixed FUC -> FUN typo in SCU.
To: Maxim Sloyko <maxims@google.com>
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
X-List-Received-Date: Tue, 18 Oct 2016 06:37:00 -0000

On Tue, Oct 18, 2016 at 4:27 AM, Maxim Sloyko <maxims@google.com> wrote:
>
>
> On Thu, Oct 13, 2016 at 5:07 PM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Fri, Sep 30, 2016 at 7:27 AM,  <maxims@google.com> wrote:
>> > From: Maxim Sloyko <maxims@google.com>
>> >
>> > Fixed FUC -> FUN typo in SCU.
>>
>> This lacks a signed off by as previously discussed.
>>
>> You have not made a convincing argument for this change. I suggest you
>> drop the patch from your series.
>
>
> Are you against this change per se or just against it being in this patch
> series?

In our tree at the moment.

We're happy to take drivers that are on their way to being upstream,
or fixes for bugs that we're hitting.

Other than that our goal should be cleaning up the tree so we can
submit it upstream. Once we submit upstream everyone has a common base
to work from, which makes doing cleanups easier.

Cheers,

Joel
