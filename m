Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x232.google.com (mail-qk0-x232.google.com
 [IPv6:2607:f8b0:400d:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBhy43z1bzDq5W
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 09:14:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bOekTzQy"; 
 dkim-atps=neutral
Received: by mail-qk0-x232.google.com with SMTP id h123so45876464qke.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 16:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=rsnpVTz5KEDNpMkUap1r9ork3mZD2O7npzo05DT1SDE=;
 b=bOekTzQyaZDIb4696u2o+jcsW4gf0+ygEFPbFYxpsYoB6wiZBf+ocOpOQlHia3pnNm
 iWi2KT+KRdVpFHf4R+1xMXxH7Ywv+VBpvGdEHDNDc2JI5l14Kh1ThXVsN3USn1Wd/PJK
 MThNcDqoncES1RyaMEiI9YDTmS2D/g/Yh6RzPFrRZio3OV4SceqUQXLrpwwmEejyHf4C
 tYDOnu/V72yMKyVvKWsPKYBnrBW9kq+0fsyIohZHryDjM1mjC/HobvJ3mNCeRyq1NNV0
 efS/tXTHOmNMvuzXBukA4MV9agQwPvZXQlLWb2nHOiekk1ax6UZBJ/QN/T7Qc+j+H80f
 6jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=rsnpVTz5KEDNpMkUap1r9ork3mZD2O7npzo05DT1SDE=;
 b=ErfhF1aPJ3vUDWgKITwlC8ij41ZsRjp/nWrA+wZ2gvjqsassCAZc2/AJ7LOWmnlFvW
 MlbVP/wrWEyK5kjM+LIs2T6aBrJSIE90W8vddR0WneytMbNytkXMKcRgrq3hfK6Pe0b7
 vUzggjLH290rU139hPeF9ZB1aNg+jetP0zwTjnjR6FwFPQFZNiFy8EyrFTlt1E3K8Pff
 a7UFtnbjRnRO+a22HGihojWREDCWtHisc0M0FIkZ5+UIMcmHqviYrWHGh7XvAYZOTlBK
 JTuIyqBEpI9qWFE5yJAQoC85Y6eno5Of+QHRPOERZJQgnpw/CjSwsfEbd2YLMTGu0YEY
 M+3A==
X-Gm-Message-State: AN3rC/5gtfmFYGEuLHJlt+jlYyZUjFsEW1OoYCCt+K/+ZuFGcLqszMAR
 PEwkb2EaB5uoofbr923ipEqBEsuVVI7+
X-Received: by 10.55.76.12 with SMTP id z12mr29914519qka.205.1493075689860;
 Mon, 24 Apr 2017 16:14:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.162.69 with HTTP; Mon, 24 Apr 2017 16:14:49 -0700 (PDT)
In-Reply-To: <1493075519.25766.241.camel@kernel.crashing.org>
References: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAFd5g47SMzF=FjYrZkVx6y-L1+D3AGHb7-gQO5W=mzvW+RnTRQ@mail.gmail.com>
 <1493075519.25766.241.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 24 Apr 2017 16:14:49 -0700
Message-ID: <CAFd5g45Z-JH6UMM=q56Y1JfmMv3T6_OFWckFb9ZT4RnPtjk7+w@mail.gmail.com>
Subject: Re: Switching to 4.10
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Edward James <eajames@us.ibm.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 23:14:53 -0000

BTW, I renamed the clock-frequency DT property to bus-frequency as
requested, so the *.dtsi will need to be updated.
