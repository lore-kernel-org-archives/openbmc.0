Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPKT83QMKzDq5v
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 14:13:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3qPKT82HnHz9sCk
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 14:13:48 +1100 (AEDT)
Subject: Re: [PATCH docs] REST API documentation for OpenBMC user management.
To: openbmc@lists.ozlabs.org
References: <1457964611-22076-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457964611-22076-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <56E77DEB.80604@ozlabs.org>
Date: Tue, 15 Mar 2016 11:13:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1457964611-22076-2-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2016 03:13:48 -0000

Hi Hari,

> From: Hariharasubramanian R <hramasub@in.ibm.com>
> 
> ---
>  obmc-userman.md | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Thanks for this! It's great to have this document. A couple of comments.
They're pretty minor though:

The doc makes reference to the REST API, but is this also applicable to
DBUS? If so, we might want to split this up a little:

 - formal DBUS specs should do into the dbus-interfaces.md document

 - informal usage guides can be a separate document

It seems that this is more the latter, which is fine. However, you may
also want to consider adding a spec to the dbus-interfaces doc as an
additional change.

The term 'userman' could be interpreted to mean "User Manual", not "User
Management". We don't really need to contract filenames this much,
calling it something like user-management.md would be fine.

Could you wrap lines at 80 chars? This makes things easier to read in
text form. Also, can you also add a reference to this to the main
README.md doc?

Also, a signed-off-by line is required, to indicate that you've agreed
to the Developers Certificate of Origin.

Cheers,


Jeremy
