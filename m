Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syDhS3HnczDvHV
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 21:19:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=BtXAD//N; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 83so6572911vkd.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Gy3nxJUVmS/yhBFwiRRJGJWWS4nfZiwb7XxWDUbu4bo=;
 b=BtXAD//NJ5hAuC4O0G5hd+QFaVX3t16r8PACfvUZFmnHNP9+RmakSjS4RBmQDlDAvM
 roKnF/jTqjmGNFYmNacqM1IF0dxT2jkAccXkVsY7wtSKAXtlp05Y1/O+Mp+W0L7MH9eM
 dXj/I7Y6eOlu8y2awEQicedbcF1ZDlJPyaLv9nYGpbO/sElj7VWoS7jpKXJUvlybPWSN
 MLf1YYrvyhVq+d8zBb5uW07W25QfXZaYkeSgdji+yBpcDSNUxBfGjMx+pHBrI0NbKQ+e
 mD+KcnaRPWWTNtv5fp6ehBnmDYw1ZFTMnND4H+P+ijzvjXHR5vDUTl8/Q1mx93i/06JW
 A69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Gy3nxJUVmS/yhBFwiRRJGJWWS4nfZiwb7XxWDUbu4bo=;
 b=BGHfW4oHZ2iY3XSF07pSQdbVGM2FZ9gpVi+DlkrR+PAMY8rGJUgw7oDV3U4TjSLIz9
 o0l73uBlDdxrDs742nSghjbm0943uUFJpBNkxVidwoJe9d9e4fJuRmTq60fatHZeOkgy
 Xdjp2WLx+B7QX+tJM5m8itD7Dr80pvbeS2n5lV7y0XGv2DIZxwgTMECgb6JQlz4siy2u
 O/ivRsdLTE7SSCcSq+fVDJrmBaYXLxni4sKvaJOIkrDleFrNET1vKFlCfEY82gyPXhYA
 uq2I21j+cSNuKRcoPllba5+8tPKBTrPYmE3vbz6LyIhUIXUaLKrO7vh25UVyKY+ifZOa
 RNog==
X-Gm-Message-State: AA6/9RnHVFQJjiaVANUK1ESKewQP56J9fQh0xz7uroGr7zIBUGWYoJRA6IfxpUZck75NQXMu2WiILKkMVhqJ0A==
X-Received: by 10.31.138.143 with SMTP id m137mr2851967vkd.148.1476699558343; 
 Mon, 17 Oct 2016 03:19:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 17 Oct 2016 03:18:57 -0700 (PDT)
In-Reply-To: <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 20:48:57 +1030
X-Google-Sender-Auth: g3wH0Sfzt6amggal23E7db41xOY
Message-ID: <CACPK8XdRuubGTBzv6oOaxQhuAfXDbn=qvxCWZYO86Aw1P7AXSA@mail.gmail.com>
Subject: Re: [PATCH linux v4 00/20] FSI device driver introduction
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Christopher Bostic <christopher.lee.bostic@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
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
X-List-Received-Date: Mon, 17 Oct 2016 10:19:21 -0000

Hey Chris,

On Mon, Oct 17, 2016 at 5:58 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Overall, this series is getting to look much better - I'd say we're in
> good shape for upstream submission soon.

I second this! You and Jeremy have made some good progress this past
week or two. Great work from both of you.

I came the OpenFSI spec[1] on the OpenPower Foundation website the
other day. I suggest you include a reference to it in your commit
message and cover letter so others can use it as a reference.

The fact that it's publicly available is particularly useful when
making the upstream submission, as it allows others to check our
implementation against a public specification.

[1] http://openpowerfoundation.org/wp-content/uploads/resources/OpenFSI-spec/content/ch_preface.html

Cheers,

Joel
