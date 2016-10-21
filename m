Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0WSx6ZB4zDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 14:32:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=rOZZQ2Sc; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id k64so9237025itb.0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 20:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jqVcJeE6uRhggtap0wwVj9fUvle25TxSNmETnM3KbDw=;
 b=rOZZQ2ScxfsMYT6bMGZ4RPYX+2xgO+mwApiMUwFb+sDVlFO0wg9Ig1rN5GtjHR9sfp
 87jrLS8FSP6SdUeaykEjRBvTCt7PxRfkPYPzGHTlCGzvzwp9cHYMlPw4H9mIksIYErwa
 jSZBgfVtVOmnKqhELcitk1VuT9TB9EO71g5lktrWC4rXqDH6CSPVsG4hhgJkUacDdjdq
 0ie1Timp4FbUZ3I2uGpsqCtb6Xgfti9UtPNXb6aUSaB1xzF1a8GYcLi7FCBz5c998fNb
 OdU9ZIW9NwjHCuKsxz6dtRfBKhhnYlLPAAHlihBjy7quJKDW/syoWyJ1SSPP3akpETlO
 t9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jqVcJeE6uRhggtap0wwVj9fUvle25TxSNmETnM3KbDw=;
 b=KCf7iBh34FsnB2C/hQsw0faCYpsot32P0Xh8jVvpzHeeogiQBbvqS/ru8sz+PiwZ/L
 K2OWAQhXf90TlqBxDDAqSAQnQdbZ8FihEh+bZgfTEjJap/IIo4/frUaUnXvXP3G28Eqg
 Dd/YHhtv6cGMu/gRtuO5dFd8lj1AaNqECbCQs0wR8yBzkNkKCPnWDZjFS0ilfMJ/UV1r
 hw7wqLdgVtmhgy48HNeq+a3Vid7U5qOoiMi/0GKWzrjyU4IHwxbqloBDB5kWk3XUyDhu
 AF+GJT9yK4Q3mTJMrgVmqITXyNjiM810Z6pFAthC0dkvyn0Q6ioMH9MEPh3ZR0Ygxe8h
 gy5Q==
X-Gm-Message-State: AA6/9RncKfxjUPeV0n7cOfzOVk0VL+bkh4LbtExID42MpeZPmGgrvwl9fFRLYUY/C/nQjHl81UsiRXCEkdsaNw==
X-Received: by 10.202.106.198 with SMTP id f189mr8984382oic.109.1477020735434; 
 Thu, 20 Oct 2016 20:32:15 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 20 Oct 2016 20:31:54 -0700 (PDT)
In-Reply-To: <20161021024128.GA8915@gwshan>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1477010866-15126-10-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8XdSn5CZQWGs-CFjcM4Hi2MmO5tbQ52AE6deAy5xnZG17A@mail.gmail.com>
 <20161021024128.GA8915@gwshan>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Oct 2016 14:01:54 +1030
X-Google-Sender-Auth: WB0r9vyGRgQsNc_WT73LFJkrhM0
Message-ID: <CACPK8Xdp4d3wJL-6xcoNriSUH_2b_y9OH2V5Hfphyguh6p535Q@mail.gmail.com>
Subject: Re: [PATCH 4.4 9/9] net/ncsi: Improve HNCDSC AEN handler
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
X-List-Received-Date: Fri, 21 Oct 2016 03:32:18 -0000

On Fri, Oct 21, 2016 at 1:11 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> On Fri, Oct 21, 2016 at 12:09:37PM +1030, Joel Stanley wrote:
>>Hi Gavin,
>>
>>On Fri, Oct 21, 2016 at 11:17 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>>> This improves AEN handler for Host Network Controller Driver Status
>>> Change (HNCDSC):
>>>
>>>    * The channel's lock should be hold when accessing its state.
>>>    * Do failover when host driver isn't ready.
>>>    * Configure channel when host driver becomes ready.
>>>
>>> NOTE: The first one isn't applied to the code in dev-4.4.
>>
>>Can you clarify what you mean here?
>>
>
> Joel, dev-4.4 is using old NCSI old where we don't have a spinlock
> for NCSI channel. dev-4.7 and upstream code has one to ensure the
> consistent read/update on NCSI channel'state. The commit log was
> picked from the patch merged to linux.net (branch: "net"), meaning
> the commit log corresponds to the code changes for upstream code.
>
> This piece of changes isn't applied to dev-4.4. So I put a note
> to clarify it. I'm too lazy and it could be more meaningful actually :)

Okay, thanks for the explanation.

Cheers,

Joel
