Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m39aZzii"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zCSQd6xqgzDqrP
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jan 2018 12:54:33 +1100 (AEDT)
Received: by mail-qt0-x243.google.com with SMTP id u10so4181138qtg.2
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jan 2018 17:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1oHZJjKtoKwrab1KO4g8XAvTbgTjOkrMr0MxN6wAKKc=;
 b=m39aZziifPPt9Q/v4PKBwseEBF3mICwxZAHf/6UuHiL/MA91bVWA86YR1cWptWSlnV
 RhMl0SuO5MTxlGAqiQPrSHWIkpuR9OKR4WWHVgZmboBkNUCuaRrzCey/BzblS75avioN
 zIJk9m2icp50GIEHTcG8oGU9/PSkW9AxOjLmY2lc7E3acUhiKrWm6K3PVFw4sFrkeMjW
 URiTC4du6nYRou/4lAdNUAoG/trYGeaDJ05F5p374UaKfVsRGdDERsGV2TPeoBacjoO+
 df3H0aefUt0VL35k2I9CIReheIsm28iRMtUVDqw8WrPPxGKtQWdpkLOCrcZrFe9XavHf
 h5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1oHZJjKtoKwrab1KO4g8XAvTbgTjOkrMr0MxN6wAKKc=;
 b=HYcDYkgXDMHiXZPq/QtnbTFwLZDunbqyXh1+h4KOmE/Xbwfa0bJsEefrCDpr+9G/9w
 2D1YLUTHTxpOo/Ad6kblxZTzMXe81A2dTl1/XOLFliqwMdJOSGSbp4qcrT+DD0/Er0eV
 jBq6vJPTHgkeINyfVgcO53ggKFCr4q0sXM6OQwMrnbxnJanrJ1eE8H2LZolT/PhdKtJe
 b8bewNFItjSJd94AxgIVGZr0nzhyqkK4nu5OckefYIy7XkrffX9kXgHAdBZ8PR5ImpPE
 pNnnHg8mHaON4cAtmpsijrjhzFRpvnIjU+SsF3J2U4nDz8pXQn1JNoeSE/zmdFgh8I16
 ahbw==
X-Gm-Message-State: AKwxytcf3Z04dAwpjCDki0Rrez0/sv6AdwDY6MI6p4GdnuWuPD3SaEAF
 SCRjZIWnwfSEijYBFLUHfDFkFyDswxxzHYSRfrbyDQ==
X-Google-Smtp-Source: ACJfBos2h7nvOYm/wwiUYHJ5ihzrelrzu/uqovuO5/5ZGefQgObCcUWZJzqFAmwKTLlAqGrCzF2sTfERop/vL8Lc5tg=
X-Received: by 10.200.37.115 with SMTP id 48mr2138339qtn.121.1515117270290;
 Thu, 04 Jan 2018 17:54:30 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Thu, 4 Jan 2018 17:54:28 -0800 (PST)
Received: by 10.200.29.9 with HTTP; Thu, 4 Jan 2018 17:54:28 -0800 (PST)
In-Reply-To: <1515076573-6732-1-git-send-email-tmaimon77@gmail.com>
References: <1515076573-6732-1-git-send-email-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Jan 2018 12:54:28 +1100
X-Google-Sender-Auth: YC4CqqM79tFBWV8UNGl81FU4Luc
Message-ID: <CACPK8Xeb_j0hsss9B=cJNTfxEmA4=f4k+p1+8KrxwC62hrzXuw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v1] net: stmmac: bypass for lpi eee hang
 issue
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a11406116b057560561fdba95"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jan 2018 01:54:34 -0000

--001a11406116b057560561fdba95
Content-Type: text/plain; charset="UTF-8"

On 5 Jan. 2018 01:36, "Tomer Maimon" <tmaimon77@gmail.com> wrote:

Bypass for lpi eee hang issue in the
STMicroelectronics 10/100/1000 Ethernet driver

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>


Can you please submit this one upstream?

If you need advice on how to do this then let me know.

Cheers,

Joel

---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 27
+++++++++++++++++------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index a916e13624eb..c19bec963e28 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -136,6 +136,7 @@ struct stmmac_priv {
        int use_riwt;
        int irq_wake;
        spinlock_t ptp_lock;
+       spinlock_t lpi_lock;
        void __iomem *mmcaddr;
        void __iomem *ptpaddr;
        u32 mss;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1763e48c84e2..4c8c7a463f40 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -333,9 +333,13 @@ static void stmmac_enable_eee_mode(struct stmmac_priv
*priv)
  */
 void stmmac_disable_eee_mode(struct stmmac_priv *priv)
 {
+       unsigned long flags;
+
        priv->hw->mac->reset_eee_mode(priv->hw);
        del_timer_sync(&priv->eee_ctrl_timer);
+       spin_lock_irqsave(&priv->lpi_lock, flags);
        priv->tx_path_in_lpi_mode = false;
+       spin_unlock_irqrestore(&priv->lpi_lock, flags);
 }

 /**
@@ -1872,6 +1876,7 @@ static void stmmac_tx_clean(struct stmmac_priv *priv,
u32 queue)

        netdev_tx_completed_queue(netdev_get_tx_queue(priv->dev, queue),
                                  pkts_compl, bytes_compl);
+       netif_tx_unlock(priv->dev);

        if (unlikely(netif_tx_queue_stopped(netdev_get_tx_queue(priv->dev,
                                                                queue))) &&
@@ -1882,11 +1887,16 @@ static void stmmac_tx_clean(struct stmmac_priv
*priv, u32 queue)
                netif_tx_wake_queue(netdev_get_tx_queue(priv->dev, queue));
        }

-       if ((priv->eee_enabled) && (!priv->tx_path_in_lpi_mode)) {
-               stmmac_enable_eee_mode(priv);
-               mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(eee_timer));
+       if (priv->eee_enabled) {
+               unsigned long flags;
+
+               spin_lock_irqsave(&priv->lpi_lock, flags);
+               if (!priv->tx_path_in_lpi_mode)
+                       mod_timer(&priv->eee_ctrl_timer,
+                                 STMMAC_LPI_T(eee_timer));
+
+               spin_unlock_irqrestore(&priv->lpi_lock, flags);
        }
-       netif_tx_unlock(priv->dev);
 }

 static inline void stmmac_enable_dma_irq(struct stmmac_priv *priv, u32
chan)
@@ -2968,6 +2978,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb,
struct net_device *dev)
        unsigned int enh_desc;
        unsigned int des;

+       if (priv->tx_path_in_lpi_mode)
+               stmmac_disable_eee_mode(priv);
+
        tx_q = &priv->tx_queue[queue];

        /* Manage oversized TCP frames for GMAC4 device */
@@ -2988,9 +3001,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb,
struct net_device *dev)
                return NETDEV_TX_BUSY;
        }

-       if (priv->tx_path_in_lpi_mode)
-               stmmac_disable_eee_mode(priv);
-
        entry = tx_q->cur_tx;
        first_entry = entry;

@@ -3638,11 +3648,13 @@ static irqreturn_t stmmac_interrupt(int irq, void
*dev_id)
                                                            &priv->xstats);

                if (unlikely(status)) {
+                       spin_lock(&priv->lpi_lock);
                        /* For LPI we need to save the tx status */
                        if (status & CORE_IRQ_TX_PATH_IN_LPI_MODE)
                                priv->tx_path_in_lpi_mode = true;
                        if (status & CORE_IRQ_TX_PATH_EXIT_LPI_MODE)
                                priv->tx_path_in_lpi_mode = false;
+                       spin_unlock(&priv->lpi_lock);
                }

                if (priv->synopsys_id >= DWMAC_CORE_4_00) {
@@ -4196,6 +4208,7 @@ int stmmac_dvr_probe(struct device *device,
        }

        spin_lock_init(&priv->lock);
+       spin_lock_init(&priv->lpi_lock);

        /* If a specific clk_csr value is passed from the platform
         * this means that the CSR Clock Range selection cannot be
--
2.14.1

--001a11406116b057560561fdba95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On 5 Jan. 2018 01:36, &quot;Tomer Maimon&quot; &lt;<a href=3D"mai=
lto:tmaimon77@gmail.com">tmaimon77@gmail.com</a>&gt; wrote:<br type=3D"attr=
ibution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Bypass for lpi eee hang issue in the<br>
STMicroelectronics 10/100/1000 Ethernet driver<br>
<br>
Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com">tmai=
mon77@gmail.com</a>&gt;<br></blockquote></div></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Can you please submit this one upstream?</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">If you need advice on how to =
do this then let me know.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Joel</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0drivers/net/ethernet/stmicro/<wbr>stmmac/stmmac.h=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 1 +<br>
=C2=A0drivers/net/ethernet/stmicro/<wbr>stmmac/stmmac_main.c | 27 +++++++++=
++++++++------<br>
=C2=A02 files changed, 21 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/drivers/net/ethernet/<wbr>stmicro/stmmac/stmmac.h b/drivers/ne=
t/ethernet/<wbr>stmicro/stmmac/stmmac.h<br>
index a916e13624eb..c19bec963e28 100644<br>
--- a/drivers/net/ethernet/<wbr>stmicro/stmmac/stmmac.h<br>
+++ b/drivers/net/ethernet/<wbr>stmicro/stmmac/stmmac.h<br>
@@ -136,6 +136,7 @@ struct stmmac_priv {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int use_riwt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int irq_wake;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spinlock_t ptp_lock;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spinlock_t lpi_lock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *mmcaddr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *ptpaddr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 mss;<br>
diff --git a/drivers/net/ethernet/<wbr>stmicro/stmmac/stmmac_main.c b/drive=
rs/net/ethernet/<wbr>stmicro/stmmac/stmmac_main.c<br>
index 1763e48c84e2..4c8c7a463f40 100644<br>
--- a/drivers/net/ethernet/<wbr>stmicro/stmmac/stmmac_main.c<br>
+++ b/drivers/net/ethernet/<wbr>stmicro/stmmac/stmmac_main.c<br>
@@ -333,9 +333,13 @@ static void stmmac_enable_eee_mode(struct stmmac_priv =
*priv)<br>
=C2=A0 */<br>
=C2=A0void stmmac_disable_eee_mode(struct stmmac_priv *priv)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;hw-&gt;mac-&gt;reset_eee_mode(<wbr>pri=
v-&gt;hw);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 del_timer_sync(&amp;priv-&gt;eee_<wbr>ctrl_time=
r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;priv-&gt;lpi_<wbr>lock, =
flags);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;tx_path_in_lpi_mode =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;priv-&gt;<wbr>lpi_l=
ock, flags);<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -1872,6 +1876,7 @@ static void stmmac_tx_clean(struct stmmac_priv *priv,=
 u32 queue)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 netdev_tx_completed_queue(<wbr>netdev_get_tx_qu=
eue(priv-&gt;dev, queue),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkts_compl, bytes_compl);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0netif_tx_unlock(priv-&gt;dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(netif_tx_queue_<wbr>stopped(netdev=
_get_tx_queue(<wbr>priv-&gt;dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 queue))) &amp;&amp;<br>
@@ -1882,11 +1887,16 @@ static void stmmac_tx_clean(struct stmmac_priv *pri=
v, u32 queue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 netif_tx_wake_queue=
(netdev_<wbr>get_tx_queue(priv-&gt;dev, queue));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((priv-&gt;eee_enabled) &amp;&amp; (!priv-&g=
t;tx_path_in_lpi_mode)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmmac_enable_eee_m=
ode(priv);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mod_timer(&amp;priv=
-&gt;eee_ctrl_<wbr>timer, STMMAC_LPI_T(eee_timer));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;eee_enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&=
amp;priv-&gt;lpi_<wbr>lock, flags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv-&gt;tx_pa=
th_in_lpi_mode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mod_timer(&amp;priv-&gt;eee_ctrl_<wbr>timer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STMMAC_LPI_T(eee_timer));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrest=
ore(&amp;priv-&gt;<wbr>lpi_lock, flags);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0netif_tx_unlock(priv-&gt;dev);<br>
=C2=A0}<br>
<br>
=C2=A0static inline void stmmac_enable_dma_irq(struct stmmac_priv *priv, u3=
2 chan)<br>
@@ -2968,6 +2978,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, s=
truct net_device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int enh_desc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int des;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;tx_path_in_lpi_mode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmmac_disable_eee_=
mode(priv);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tx_q =3D &amp;priv-&gt;tx_queue[queue];<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Manage oversized TCP frames for GMAC4 device=
 */<br>
@@ -2988,9 +3001,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, s=
truct net_device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NETDEV_TX_BU=
SY;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;tx_path_in_lpi_mode)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmmac_disable_eee_=
mode(priv);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =3D tx_q-&gt;cur_tx;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 first_entry =3D entry;<br>
<br>
@@ -3638,11 +3648,13 @@ static irqreturn_t stmmac_interrupt(int irq, void *=
dev_id)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;priv-&g=
t;xstats);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(status=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0spin_lock(&amp;priv-&gt;lpi_lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* For LPI we need to save the tx status */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (status &amp; CORE_IRQ_TX_PATH_IN_LPI_MODE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;tx_path_in_lpi_mode =3D tru=
e;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (status &amp; CORE_IRQ_TX_PATH_EXIT_LPI_<wbr>MODE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;tx_path_in_lpi_mode =3D fal=
se;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0spin_unlock(&amp;priv-&gt;lpi_lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (priv-&gt;synops=
ys_id &gt;=3D DWMAC_CORE_4_00) {<br>
@@ -4196,6 +4208,7 @@ int stmmac_dvr_probe(struct device *device,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_init(&amp;priv-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;priv-&gt;lpi_<wbr>lock);<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If a specific clk_csr value is passed from t=
he platform<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this means that the CSR Clock Range sel=
ection cannot be<br>
<font color=3D"#888888">--<br>
2.14.1<br>
<br>
</font></blockquote></div><br></div></div></div>

--001a11406116b057560561fdba95--
