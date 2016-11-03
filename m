Return-Path: <geissonator@gmail.com>
Received: from mail-yw0-x22c.google.com (mail-yw0-x22c.google.com
 [IPv6:2607:f8b0:4002:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8mnq3V9yzDvPG
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 01:00:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=O3q3+KLq; 
 dkim-atps=neutral
Received: by mail-yw0-x22c.google.com with SMTP id l124so46249791ywb.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 07:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=b+22e6q/XervN9nPt/F6+1KVWMvmZR8bUulqYDHV3tk=;
 b=O3q3+KLqA5pGqYlex7nBLexF+bOXOb4E97xy41olNQ1SYSsH0uarhFyqvIFPgTMvLS
 udjQ3p7DPXnQczqg+nbolI+Rm8ltyRXyAcX61h7Z5F6go7O7kW+qd93GH2cyFYwbeNAC
 Mrv+/d5d1b+rPANIPm8KOtMuGgY/1ChhLkZHKG6pKfoepsvXcduaoriQebKLNW+7v0fu
 tvyqcBrC76TK9Dx1vm74bjwNmser2MvRLPYrqeuGZUM2OgZB8H/Hy/SrMMYTf3R2LGzK
 QRhxUUlcvXgaHxNyT5RHkqKuHm3lPY/HBu/hp82HsWSeFVxCMgTZGBRKccmfGFJoVLhz
 OybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=b+22e6q/XervN9nPt/F6+1KVWMvmZR8bUulqYDHV3tk=;
 b=ae2AUhKnNxmDK/5EHc/Gj/38z3ka1pQ/yOewgpuLwAinOf9DT96rs9RYGMeNf457Re
 md3zFrI+ikGKeWK4MyJeSUurayMPVdfEVtn2awsQWanIfpJIZwvSzi9J301qNrpGSwQN
 BQ5FyiQu7ujhMhfieqaIaQbgFIBiNRmB3/PVgqfR5cC6f/GfgT4TqqrTMPnAy/vg0hDN
 pbMOZHjrgImeJ2pyQ8ATo5UiWNQ3IVYlnT/CqYjKlJ4d8vUhEbv1U6mSZG/eCCqZsPam
 krui9/FnoN5iq4xG56fkqUqh9VN4ef1GLdaQcHc41i1GJrhoDPm7nRx4xz+SF5OYefZv
 FKXg==
X-Gm-Message-State: ABUngve3N1QNzz5U1SZwnmMvdjCdbW4z6m5tnr9inXPAHFd4hQesxnjHLkpOqPtQjvlzTXZS1GPL5t56cEX7kQ==
X-Received: by 10.36.17.133 with SMTP id 127mr1691626itf.31.1478181629199;
 Thu, 03 Nov 2016 07:00:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.83 with HTTP; Thu, 3 Nov 2016 07:00:28 -0700 (PDT)
In-Reply-To: <CACPK8Xd3XC9WcSmnz61NFaEJZPDowL71XovBRqPVYE7DbpEqsQ@mail.gmail.com>
References: <20161031150038.zcvop7gbpu44ojsf@asimov>
 <1AF77AD5-4ACB-4DCF-8429-A87096312A27@fuzziesquirrel.com>
 <CAPH-5w5ZUracAQ+mbLtBHaAeo9F+FpyDi-2yQ9UPWExj2__Xiw@mail.gmail.com>
 <CACPK8Xd3XC9WcSmnz61NFaEJZPDowL71XovBRqPVYE7DbpEqsQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 3 Nov 2016 09:00:28 -0500
Message-ID: <CALLMt=oSw8qupiSjqzCTsByYqjRMwEaiiY5nmaRGABrnFTWPyQ@mail.gmail.com>
Subject: Re: Opinions on CLI tools.
To: Joel Stanley <joel@jms.id.au>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Thu, 03 Nov 2016 14:00:32 -0000

I still feel like we're doing a lot of "developer-biased" decision
making here.  We're going to have people in the lab and other general
users of obmc that shouldn't have to understand the details of our
implementation of things like service states and such.

As a general user of a system with an obmc, I want to simply know "Is
everything running as expected"  "Is the system in a state where it
can perform it's intended function"
And also, I want a simple command to "put it in the state where it can
do it's intended function".

This to me is a lot like all of our software design principles,
abstract the details away!  I don't care how the stl implements a
vector, I just want a vector.  If I'm writing the stl implementation
then obviously I care about it's details.

But, the above was definitely not the consensus last week in the
workshop.  I know what will happen, at least in the lab here in IBM,
people will write their own wrappers, they'll put them in shared
locations for others to use, and we'll then start getting issues
opened against us with people using those wrappers.

Luckily, this is a fairly easy issue to solve it becomes a problem (as
I predict), so starting with a design where we do nothing is not the
worst decision :)

Andrew

On Tue, Nov 1, 2016 at 6:50 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Nov 2, 2016 at 8:41 AM, Xo Wang <xow@google.com> wrote:
>> Hi Patrick, Brad:
>>
>> Based on your criteria, I think iotools would fall into the category
>> of a narrow-mindshare tool when viewed from the broader project
>> perspective.
>>
>> We'll keep the iotools image inclusion internal to our layer, since
>> the primary benefit is Google developer familiarity and ease of
>> porting our collection of traditionally host-side scripts that depend
>> on it.
>
> Out of interest, which of the tools in there are you using?
>
> Cheers,
>
> Joel
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
