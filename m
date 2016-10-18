Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sycTx0SfPzDvRg
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 12:11:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sycTw4QWRz9s65;
 Tue, 18 Oct 2016 12:11:32 +1100 (AEDT)
Subject: Re: [PATCH linux v4 00/20] FSI device driver introduction
To: Joel Stanley <joel@jms.id.au>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
 <CACPK8XdRuubGTBzv6oOaxQhuAfXDbn=qvxCWZYO86Aw1P7AXSA@mail.gmail.com>
Cc: Christopher Bostic <christopher.lee.bostic@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com, Stewart Smith <stewart@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <9b755123-6e08-69ee-f411-1a9a7f0e27ba@ozlabs.org>
Date: Tue, 18 Oct 2016 09:11:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdRuubGTBzv6oOaxQhuAfXDbn=qvxCWZYO86Aw1P7AXSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 18 Oct 2016 01:11:33 -0000

Hi Chris & Joel,

> I came the OpenFSI spec[1] on the OpenPower Foundation website the
> other day. I suggest you include a reference to it in your commit
> message and cover letter so others can use it as a reference.
> 
> The fact that it's publicly available is particularly useful when
> making the upstream submission, as it allows others to check our
> implementation against a public specification.
> 
> [1] http://openpowerfoundation.org/wp-content/uploads/resources/OpenFSI-spec/content/ch_preface.html

Good idea.

Chris: you also have some useful info in your cover letter (00/20),
under the Common FSI Terminology section.  However, this will be lost
once the series is merged. So, I'd suggest putting that info in a new
patch to add Documentation/fsi.txt, with the link above, and a little
introductory text.

Cheers,


Jeremy
