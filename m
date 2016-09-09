Return-Path: <maxims@google.com>
Received: from mail-yw0-x22e.google.com (mail-yw0-x22e.google.com
 [IPv6:2607:f8b0:4002:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sW4M32KsczDrpW
 for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2016 03:43:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=GZi1hC0h; 
 dkim-atps=neutral
Received: by mail-yw0-x22e.google.com with SMTP id g192so51599091ywh.1
 for <openbmc@lists.ozlabs.org>; Fri, 09 Sep 2016 10:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MwwvSMe+ynYeKjnCYE+f6gFJVxiIWW/i8UXbjuXyTRM=;
 b=GZi1hC0h99mQG3rP9ItPPbptjvihLa+i2JVytbdkBqdNGrZWPe/xiKOt+ety3meieb
 dR9s2izZjj6zS+iFH5K5nbh8VwEX7dQuhEHbKmNyvwD0g9nW/9WluyszV3TnAuPwmcPV
 f7suHSvmDBvgMxJDQuaoCiTRzwFZfynH26zD4o6YWIXYDUH12bAsP3VjNjILivjwl6eH
 YUb0/B8RKmB2jaSI9a58foyHZKQAnwYFYWCcpq/UGAW0M+YiaG4uaZaUDxLeQoFs3IRr
 ifFx9+EJYi4T1WmKHwJokIkY3f5AOTLmFU8ka5C8QxiVKdUfz6EAYascUg6+YO8Z6uSy
 9UoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MwwvSMe+ynYeKjnCYE+f6gFJVxiIWW/i8UXbjuXyTRM=;
 b=E6wUQK/P3PCZiV79E7sRRtZosfRA+zN5EdK+EGqA/U4d2qRoyHdtFo/BAkOe8IXw06
 jSggdzvSGe8Wevrh43RcPvlWx3JDI/kYn6yBLv6KjCg0yoFuHmel+p3TU8/DAEGuvFA9
 kbfKT/L86VqsT9nHPVDn7lymcN4o7o4llX9WhWnahVn24AJk8DawVIHogSZ6cq9hG246
 4oEPiZviVMVakU3Mk517ut2P5s76nuMQHgOEgivkZjngGrvNknu07puaJuPNaVkdt/SH
 Tf4bg8esPA3opgqV53wo7TUVjrTlTZl0kkD1cNj0Aog4QVjFC4LYvc5Gmtf6MnLIEC+f
 h8EA==
X-Gm-Message-State: AE9vXwOIs36/VSWKDTkHOJH7Ojb8b8+WfbFC04oXgSHsISggxpkRsL19ALQgAMbNYT1SD1rLX551HG+RyXShTIAh
X-Received: by 10.129.80.138 with SMTP id e132mr4104306ywb.130.1473443034523; 
 Fri, 09 Sep 2016 10:43:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.199.210 with HTTP; Fri, 9 Sep 2016 10:43:53 -0700 (PDT)
In-Reply-To: <CACPK8XexZKE25KxJrd74Ly3iwvYBGcOr_A8oPFh0Z8BvVpaqMw@mail.gmail.com>
References: <1472839086-30137-1-git-send-email-maxims@google.com>
 <CACPK8XexZKE25KxJrd74Ly3iwvYBGcOr_A8oPFh0Z8BvVpaqMw@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 9 Sep 2016 10:43:53 -0700
Message-ID: <CAFR_W8oTK9Of_0Q4L6sEnFS5xBn_0g265Hh8FHE_OP5J9-SvSw@mail.gmail.com>
Subject: Re: [PATCH] aspeed/ast-g5: Added ast_uart.{c, h} files, moved most of
 the diagnostic message printing to ast-g5.c
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Teddy Reed V <teddy.reed@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary=001a1147fa52abd9fa053c16b004
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Sep 2016 17:44:01 -0000

--001a1147fa52abd9fa053c16b004
Content-Type: text/plain; charset=UTF-8

Sorry, the new patch is in separate message, I'm still trying to figure out
how this process works.

On Wed, Sep 7, 2016 at 5:30 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hello Maxim,
>
> On Sat, Sep 3, 2016 at 3:28 AM,  <maxims@google.com> wrote:
> > From: Maxim Sloyko <maxims@google.com>
> >
> > Set up a stack in SRAM at the beginning of lowlevel_init, which makes it
> > possible to call non-trivial C functions, as well as put diagnostic
> > strings themselves onto the stack.
>
> Thanks for the patch. I am happy to see efforts to tame platform.S
> into something we can maintain and upstream. Do you plan on continuing
> this cleanup?
>

Time-permitting, yes. I'm trying to move all of this to Driver Model with
device tree, which I think will make most of platform.S obsolete. No
promises yet though.


>
> A bigger picture question: is there a good reason to retain these
> messages at boot? I don't think they provide any use for developers.
> They might be useful at bring up though. What are your thoughts?
>

They are somewhat useful to me at the moment, yes.


>
> >
> > Several one-char writes to debug uart still remain in platform.S, I
> > figured it's not worth it to make a separate call to c function for each
> > of those.
> > ---
> >  arch/arm/include/asm/arch-aspeed/ast_uart.h | 142 +++++++++++
> >  arch/arm/include/asm/arch-aspeed/regs-scu.h |   4 +-
> >  arch/arm/mach-aspeed/Makefile               |   2 +-
> >  arch/arm/mach-aspeed/ast_uart.c             |  38 +++
> >  board/aspeed/ast-g5/ast-g5.c                | 110 ++++++++-
> >  board/aspeed/ast-g5/platform.S              | 351
> +++-------------------------
> >  6 files changed, 318 insertions(+), 329 deletions(-)
> >  create mode 100644 arch/arm/include/asm/arch-aspeed/ast_uart.h
> >  create mode 100644 arch/arm/mach-aspeed/ast_uart.c
> >
> > diff --git a/arch/arm/include/asm/arch-aspeed/ast_uart.h
> b/arch/arm/include/asm/arch-aspeed/ast_uart.h
> > new file mode 100644
> > index 0000000..ddf1a14
> > --- /dev/null
> > +++ b/arch/arm/include/asm/arch-aspeed/ast_uart.h
> > @@ -0,0 +1,142 @@
> > +/**********************************************************
> *********************
> > + * Copyright (C) 2016 Google Inc
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of the
> > + * License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but
> > + * WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> > + * General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, write to the Free Software
> > + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> > + * USA
> > + ************************************************************
> ******************/
>
> Drop the ascii art.
>
> u-boot uses the  SPDX-License-Identifier tags. See
> http://www.denx.de/wiki/U-Boot/Licensing
>
>
Fixed.


> > +
> > +#ifndef __AST_UART_H
> > +#define __AST_UART_H
> > +
> > +#include <asm/io.h>
> > +
> > +#define AST_UART_RBR(uart)      (uart)
> > +#define AST_UART_THR(uart)      (uart)
> > +#define AST_UART_IER(uart)      ((uart) + 0x4)
> > +#define AST_UART_IIR(uart)      ((uart) + 0x8)
> > +#define AST_UART_FCR(uart)      ((uart) + 0x8)
> > +#define AST_UART_LCR(uart)      ((uart) + 0xc)
> > +#define AST_UART_MCR(uart)      ((uart) + 0x10)
> > +#define AST_UART_LSR(uart)      ((uart) + 0x14)
> > +#define AST_UART_MSR(uart)      ((uart) + 0x18)
> > +#define AST_UART_SCR(uart)      ((uart) + 0x1c)
> > +
> > +/* These registers can only be written when DLAB = 1*/
> > +#define AST_UART_DLL(uart)      ((uart))
> > +#define AST_UART_DLH(uart)      ((uart) + 0x4)
> > +
> > +/* Registers' contents */
> > +
> > +#define AST_UART_IER_THRE       (1 << 7)
> > +#define AST_UART_IER_EDSSI      (1 << 3)
> > +#define AST_UART_IER_ELSI       (1 << 2)
> > +#define AST_UART_IER_ETBEI      (1 << 1)
> > +#define AST_UART_IER_ERBFI      (1 << 0)
> > +
> > +/* AND this mask with AST_UART_IIR to find out if FIFOs are enabled. */
> > +#define AST_UART_IIR_FEN_MASK   (3 << 6)
> > +
> > +/* Bit0 == 0 means that the interrupt is pending, bits 3:1 identify
> > + * interrupt.  These values are defined so that IIR | 0xf would give
> you the
> > + * value for the interrupt. */
> > +#define AST_UART_IIR_MSC        (0)
> > +#define AST_UART_IIR_THRE       (1 << 1)
> > +#define AST_UART_IIR_RDA        (2 << 1)
> > +#define AST_UART_IIR_RS         (3 << 1)
> > +#define AST_UART_IIR_CTO        (6 << 1)
> > +
> > +/* RX FIFO Interrupt trigger level */
> > +#define AST_UART_FCR_RXFITL_MASK    (3 << 6)
> > +/* One byte received */
> > +#define AST_UART_FCR_RXFITL1    (0)
> > +/* 4 bytes received */
> > +#define AST_UART_FCR_RXFITL4    (1 << 6)
> > +/* 8 bytes received */
> > +#define AST_UART_FCR_RXFITL8    (2 << 6)
> > +/* 14 bytes received */
> > +#define AST_UART_FCR_RXFITL14   (3 << 6)
> > +
> > +/* TX FIFO Interrupt trigger level */
> > +#define AST_UART_FCR_TXFITL_MASK    (3 << 4)
> > +/* FIFO Empty (0 bytes in FIFO) */
> > +#define AST_UART_FCR_TXFITL0    (0)
> > +/* 2 bytes in FIFO */
> > +#define AST_UART_FCR_TXFITL2    (1 << 4)
> > +/* FIFO 1/4 full (4 bytes) */
> > +#define AST_UART_FCR_TXFITLQ    (2 << 4)
> > +/* FIFO 1/2 full (8 bytes) */
> > +#define AST_UART_FCR_TXFITLH    (3 << 4)
> > +
> > +#define AST_UART_FCR_TXFRST     (1 << 2)
> > +#define AST_UART_FCR_RXFRST     (1 << 1)
> > +#define AST_UART_FCR_FEN        (1 << 0)
> > +
> > +#define AST_UART_LCR_DLAB       (1 << 7)
> > +#define AST_UART_LCR_BC         (1 << 6)
> > +#define AST_UART_LCR_EPS        (1 << 4)
> > +#define AST_UART_LCR_PEN        (1 << 3)
> > +#define AST_UART_LCR_STOP       (1 << 2)
> > +
> > +/* Number of bits per character */
> > +#define AST_UART_LCR_BPC_MASK   (3)
> > +#define AST_UART_LCR_BPC5       (0)
> > +#define AST_UART_LCR_BPC6       (1)
> > +#define AST_UART_LCR_BPC7       (2)
> > +#define AST_UART_LCR_BPC8       (3)
> > +
> > +#define AST_UART_MCR_LB         (1 << 4)
> > +#define AST_UART_MCR_OUT2       (1 << 3)
> > +#define AST_UART_MCR_OUT1       (1 << 2)
> > +#define AST_UART_MCR_RTS        (1 << 1)
> > +#define AST_UART_MCR_DTR        (1 << 0)
> > +
> > +#define AST_UART_LSR_ERXF       (1 << 7)
> > +#define AST_UART_LSR_TEMPTY     (1 << 6)
> > +#define AST_UART_LSR_THRE       (1 << 5)
> > +#define AST_UART_LSR_BI         (1 << 4)
> > +#define AST_UART_LSR_FE         (1 << 3)
> > +#define AST_UART_LSR_PE         (1 << 2)
> > +#define AST_UART_LSR_OE         (1 << 1)
> > +#define AST_UART_LSR_DR         (1 << 0)
> > +
> > +#define AST_UART_MSR_NDCD_OUT2  (1 << 7)
> > +#define AST_UART_MSR_NRI_OUT1   (1 << 6)
> > +#define AST_UART_MSR_NDSR_NDTR  (1 << 5)
> > +#define AST_UART_MSR_NCTS_NRTS  (1 << 4)
> > +#define AST_UART_MSR_DDCD       (1 << 3)
> > +#define AST_UART_MSR_TERI       (1 << 2)
> > +#define AST_UART_MSR_DDSR       (1 << 1)
> > +#define AST_UART_MSR_DCTS       (1 << 0)
> > +
> > +#define AST_UART_FIFO_SIZE      (16)
> > +
> > +#define ast_uart_wait_txempty(uart) while(!(readl(AST_UART_LSR((uart)))
> & AST_UART_LSR_TEMPTY))
> > +#define ast_uart_write(uart, c)     writel((c), AST_UART_THR((uart)))
> > +#define ast_uart_enable_fifo(uart)  setbits_le32(AST_UART_FCR((uart)),
> AST_UART_FCR_FEN)
> > +#define ast_uart_enable_thre_mode(uart) setbits_le32(AST_UART_IER(uart),
> AST_UART_IER_THRE)
>
> Why not functions for these?
>

Just to avoid function call overhead. They look simple enough.


>
> > +
> > +/* In THRE and FIFO mode, wait until there is some space in FIFO */
> > +#define ast_uart_wait_fifo_ready(uart) while((readl(AST_UART_LSR(uart))
> & AST_UART_LSR_THRE))
> > +
> > +#define ast_uart_set_bpc(uart, bpc) clrsetbits_le32(AST_UART_LCR((uart)),
> AST_UART_LCR_BPC_MASK, (bpc))
> > +
> > +#define ast_uart_unlock_dlab(uart) setbits_le32(AST_UART_LCR((uart)),
> AST_UART_LCR_DLAB)
> > +#define ast_uart_lock_dlab(uart) clrbits_le32(AST_UART_LCR(uart),
> AST_UART_LCR_DLAB)
> > +
> > +/* NOTE: These write functions only work when THRE mode and FIFOs are
> enabled. */
> > +void ast_uart_write_buffer_sync(uint32_t uart, const uint8_t* buffer,
> uint16_t len);
> > +void ast_uart_write_string_sync(uint32_t uart, const char* s);
> > +
> > +#endif
> > diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> > index b89df82..b714fa9 100644
> > --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> > +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> > @@ -10,8 +10,8 @@
> >   *    1. 2012/12/29 Ryan Chen Create
> >   *
> >  ************************************************************
> ********************/
> > -#ifndef __AST_SCU_H
> > -#define __AST_SCU_H                     1
> > +#ifndef __AST_REGS_SCU_H
> > +#define __AST_REGS_SCU_H                     1
> >
> >  #include <asm/arch/aspeed.h>
> >
> > diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/
> Makefile
> > index d72f62a..3e0b4f7 100644
> > --- a/arch/arm/mach-aspeed/Makefile
> > +++ b/arch/arm/mach-aspeed/Makefile
> > @@ -11,5 +11,5 @@
> >  #
> >
> >
> > -obj-y += timer.o reset.o cpuinfo.o ast-scu.o ast-ahbc.o ast-sdmc.o
> > +obj-y += timer.o reset.o cpuinfo.o ast-scu.o ast-ahbc.o ast-sdmc.o
> ast_uart.o
> >  obj-$(CONFIG_AST_SPI_NOR) += flash.o
> > diff --git a/arch/arm/mach-aspeed/ast_uart.c b/arch/arm/mach-aspeed/ast_
> uart.c
> > new file mode 100644
> > index 0000000..1226827
> > --- /dev/null
> > +++ b/arch/arm/mach-aspeed/ast_uart.c
> > @@ -0,0 +1,38 @@
> > +/**********************************************************
> *********************
> > + * Copyright (C) 2016 Google Inc
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of the
> > + * License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but
> > + * WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> > + * General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, write to the Free Software
> > + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> > + * USA
> > + ************************************************************
> ******************/
>
> Fix the header.
>
> > +
> > +#include <asm/io.h>
> > +#include <asm/arch/ast_uart.h>
> > +
> > +void ast_uart_write_buffer_sync(uint32_t uart, const uint8_t *buffer,
> > +                               uint16_t len)
> > +{
> > +       for (; len; --len, ++buffer) {
> > +               ast_uart_wait_fifo_ready(uart);
> > +               ast_uart_write(uart, *buffer);
> > +       }
> > +}
> > +
> > +void ast_uart_write_string_sync(uint32_t uart, const char *s)
> > +{
> > +       for (; *s; ++s) {
> > +               ast_uart_wait_fifo_ready(uart);
> > +               ast_uart_write(uart, *s);
> > +       }
> > +}
>
> Is there any way we could reuse common string/serial code from u-boot?
>

Maybe, I have no experience with that. Making this fully compatible with
console or serial is somewhat out of scope of what I'm trying to do here.


>
> > diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
> > index 81ea88a..b0b8535 100644
> > --- a/board/aspeed/ast-g5/ast-g5.c
> > +++ b/board/aspeed/ast-g5/ast-g5.c
> > @@ -35,16 +35,21 @@
> >
> >  #include <common.h>
> >  #include <netdev.h>
> > -#include <asm/arch/ast_scu.h>
> > +#include <asm/arch/ast_g5_platform.h>
> >  #include <asm/arch/ast-sdmc.h>
> > +#include <asm/arch/ast_scu.h>
> > +#include <asm/arch/ast_uart.h>
> > +#include <asm/arch/regs-scu.h>
> >  #include <asm/io.h>
> >
> > +#define AST_DEBUG_UART      (0x1e784000)
> > +
> >  DECLARE_GLOBAL_DATA_PTR;
> >
> >  #if defined(CONFIG_SHOW_BOOT_PROGRESS)
> >  void show_boot_progress(int progress)
> >  {
> > -    printf("Boot reached stage %d\n", progress);
> > +       printf("Boot reached stage %d\n", progress);
>
> This appears unrelated to your changes.
>

I'll send automatic style fixes in a separate patch.


>
> >  }
> >  #endif
> >
> > @@ -66,9 +71,108 @@ int dram_init(void)
> >         return 0;
> >  }
> >
> > +/* assumes digit < 16 */
> > +static inline char hex_digit(uint8_t digit)
> > +{
> > +       if (digit < 10) {
> > +               return '0' + digit;
> > +       } else {
> > +               return 'a' + (digit - 10);
> > +       }
> > +}
> > +
> > +static inline void format_u8_hex(char *dst, uint8_t value)
> > +{
> > +       *dst = hex_digit(value >> 4);
> > +       *(dst + 1) = hex_digit(value & 0xf);
> > +}
>
> These are common printf formatting. Can we use them from another part of
> u-boot?
>
> > +
> > +static inline void debug_uart_print(const char *s)
> > +{
> > +       ast_uart_write_string_sync(AST_DEBUG_UART, s);
> > +}
> > +
> > +void debug_print_ddr_version(uint8_t version)
> > +{
> > +       char message[8] = "-DDR_\r\n";
> > +       message[4] = '0' + version;
> > +       debug_uart_print(message);
> > +}
> > +
> > +void debug_print_dram_init_message(uint8_t version)
> > +{
> > +       char message[16] = "\r\nDRAM Init-V__";
> > +       char *version_dst = message + 13;
> > +       format_u8_hex(version_dst, version);
> > +       debug_uart_print(message);
> > +}
> > +
> > +void debug_print_dram_size(char size)
> > +{
> > +       char message[6] = "-_Gb-";
> > +       message[1] = size;
> > +       debug_uart_print(message);
> > +}
> > +
> > +void debug_print_ddr_status(bool done)
> > +{
> > +       if (done) {
> > +               debug_uart_print("Done\r\n");
> > +       } else {
> > +               debug_uart_print("Fail\r\n");
> > +       }
> > +}
> > +
> > +static inline void format_phy_timing(char *dst, uint8_t value)
> > +{
> > +       /* This is adopted from platforms.S file by Aspeed.
> > +        * They read memory address (which is not mentioned in the data
> sheet)
> > +        * and then divide byte value by 510 and print 4 digits after
> the dot.
> > +        */
> > +       uint32_t timing_value = value * 1000 / 51;
> > +       for (int index = 3; index >= 0 && timing_value > 0; --index) {
> > +               uint8_t digit = timing_value % 10;
> > +               timing_value /= 10;
> > +               dst[index] = '0' + digit;
> > +       }
> > +}
> > +
> > +void debug_print_ddr_phy_timing(uint16_t margin)
> > +{
> > +       char message[46] = "Read margin DL:0.0000/0.0000 CK (min:
> 0.35)\r\n";
> > +       format_phy_timing(message + 17, margin & 0xff);
> > +       format_phy_timing(message + 24, (margin >> 8) & 0xff);
> > +       debug_uart_print(message);
> > +}
> > +
> > +static void init_uart_for_debug(uint32_t uart_base)
> > +{
> > +       ast_uart_set_bpc(uart_base, AST_UART_LCR_BPC8);
> > +       ast_uart_unlock_dlab(uart_base);
> > +       const uint32_t uart_clk_mul =
> > +           readl(AST_SCU_BASE + AST_SCU_MISC1_CTRL) & (1 << 12) ? 1 :
> 13;
> > +#ifdef CONFIG_DRAM_UART_38400
> > +       const uint32_t br_base = 3 * uart_clk_mul;
> > +#else
> > +       const uint32_t br_base = 1 * uart_clk_mul;
> > +#endif
> > +       writel(br_base, AST_UART_DLL(uart_base));
> > +       writel(0, AST_UART_DLH(uart_base));
> > +
> > +       /* Lock DLAB */
> > +       ast_uart_lock_dlab(uart_base);
> > +       ast_uart_enable_fifo(uart_base);
> > +       ast_uart_enable_thre_mode(uart_base);
> > +}
> > +
> > +void init_debug_uart(void)
> > +{
> > +       init_uart_for_debug(AST_DEBUG_UART);
> > +}
> > +
> >  #ifdef CONFIG_CMD_NET
> >  int board_eth_init(bd_t *bd)
> >  {
> > -        return ftgmac100_initialize(bd);
> > +       return ftgmac100_initialize(bd);
>
> Unrelated change.
>
> >  }
> >  #endif
> > diff --git a/board/aspeed/ast-g5/platform.S b/board/aspeed/ast-g5/
> platform.S
> > index c810f44..a33afee 100644
> > --- a/board/aspeed/ast-g5/platform.S
> > +++ b/board/aspeed/ast-g5/platform.S
> > @@ -78,7 +78,6 @@
> >  #include <version.h>
> >
> >  /***********************************************************
> *******************
> > -  r4 : return program counter
>
> ??
>

r4 is no longer used in this code.


>
> >    r5 : DDR speed timing table base address
> >    Free registers:
> >    r0, r1, r2, r3, r6, r7, r8, r9, r10, r11
> > @@ -104,6 +103,9 @@
> >  #define ASTMMC_REGIDX_RFC    0x3C
> >  #define ASTMMC_REGIDX_PLL    0x40
> >
> > +#define AST_SRAM_END  0x1e728ffc
> > +
> > +
> >  TIME_TABLE_DDR3_1333:
> >      .word   0x53503C37       @ 0x010
> >      .word   0xF858D47F       @ 0x014
> > @@ -242,12 +244,20 @@ TIME_TABLE_DDR4_1600:
> >   Calibration Macro End
> >   ************************************************************
> ******************/
> >
> > +.globl debug_print_dram_init_message
> > +.globl debug_print_ddr_version
> > +.globl debug_print_dram_size
> > +.globl debug_print_ddr_status
> > +.globl debug_print_ddr_phy_timing
> > +.globl init_debug_uart
> >  .globl lowlevel_init
> >  lowlevel_init:
> >
> >  init_dram:
> > +    /* Setup a stack in SRAM */
> > +    ldr   sp, =AST_SRAM_END
> >      /* save lr */
> > -    mov   r4, lr
> > +    push  {lr}
> >
> >      /* Clear AHB bus lock condition */
> >      ldr   r0, =0x1e600000
> > @@ -489,82 +499,10 @@ wait_mmc_reset_done:
> >      ldr   r1, =0x00020000
> >      str   r1, [r0]
> >
> > -/* Debug - UART console message */
> > -    ldr   r0, =0x1e78400c
> > -    mov   r1, #0x83
> > -    str   r1, [r0]
> > -
> > -    ldr   r0, =0x1e6e202c
> > -    ldr   r2, [r0]
> > -    mov   r2, r2, lsr #12
> > -    tst   r2, #0x01
> > -    ldr   r0, =0x1e784000
> > -    moveq r1, #0x0D                              @ Baudrate 115200
> > -    movne r1, #0x01                              @ Baudrate 115200,
> div13
> > -#ifdef CONFIG_DRAM_UART_38400
> > -    moveq r1, #0x27                              @ Baudrate 38400
> > -    movne r1, #0x03                              @ Baudrate 38400 ,
> div13
> > -#endif
> > -    str   r1, [r0]
> > -
> > -    ldr   r0, =0x1e784004
> > -    mov   r1, #0x00
> > -    str   r1, [r0]
> > -
> > -    ldr   r0, =0x1e78400c
> > -    mov   r1, #0x03
> > -    str   r1, [r0]
> > -
> > -    ldr   r0, =0x1e784008
> > -    mov   r1, #0x07
> > -    str   r1, [r0]
> > +    bl    init_debug_uart
> >
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x0D                              @ '\r'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0A                              @ '\n'
> > -    str   r1, [r0]
> > -    mov   r1, #0x44                              @ 'D'
> > -    str   r1, [r0]
> > -    mov   r1, #0x52                              @ 'R'
> > -    str   r1, [r0]
> > -    mov   r1, #0x41                              @ 'A'
> > -    str   r1, [r0]
> > -    mov   r1, #0x4D                              @ 'M'
> > -    str   r1, [r0]
> > -    mov   r1, #0x20                              @ ' '
> > -    str   r1, [r0]
> > -    mov   r1, #0x49                              @ 'I'
> > -    str   r1, [r0]
> > -    mov   r1, #0x6E                              @ 'n'
> > -    str   r1, [r0]
> > -    mov   r1, #0x69                              @ 'i'
> > -    str   r1, [r0]
> > -    mov   r1, #0x74                              @ 't'
> > -    str   r1, [r0]
> > -    mov   r1, #0x2D                              @ '-'
> > -    str   r1, [r0]
> > -    mov   r1, #0x56                              @ 'V'
> > -    str   r1, [r0]
> > -    mov   r1, #ASTMMC_INIT_VER
> > -    mov   r1, r1, lsr #4
> > -    print_hex_char
> > -    mov   r1, #ASTMMC_INIT_VER
> > -    print_hex_char
> > -    mov   r1, #0x2D                              @ '-'
> > -    str   r1, [r0]
> > -    ldr   r0, =0x1e784014
> > -wait_print:
> > -    ldr   r1, [r0]
> > -    tst   r1, #0x40
> > -    beq   wait_print
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x44                              @ 'D'
> > -    str   r1, [r0]
> > -    mov   r1, #0x44                              @ 'D'
> > -    str   r1, [r0]
> > -    mov   r1, #0x52                              @ 'R'
> > -    str   r1, [r0]
> > +    mov   r0, #ASTMMC_INIT_VER
> > +    bl    debug_print_dram_init_message
> >  /* Debug - UART console message */
> >
> >  /***********************************************************
> *******************
> > @@ -647,15 +585,8 @@ wait_print:
> >   DDR3 Init
> >   ************************************************************
> ******************/
> >  ddr3_init:
> > -/* Debug - UART console message */
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x33                              @ '3'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0D                              @ '\r'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0A                              @ '\n'
> > -    str   r1, [r0]
> > -/* Debug - UART console message */
> > +    mov   r0, #3
> > +    bl    debug_print_ddr_version
> >
> >  #if   defined (CONFIG_DRAM_1333)
> >      adrl  r5, TIME_TABLE_DDR3_1333               @ Init DRAM parameter
> table
> > @@ -865,15 +796,8 @@ ddr3_check_dllrdy:
> >   DDR4 Init
> >   ************************************************************
> ******************/
> >  ddr4_init:
> > -/* Debug - UART console message */
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x34                              @ '4'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0D                              @ '\r'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0A                              @ '\n'
> > -    str   r1, [r0]
> > -/* Debug - UART console message */
> > +    mov   r0, #4
> > +    bl    debug_print_ddr_version
> >
> >  #if   defined (CONFIG_DRAM_1333)
> >      adrl  r5, TIME_TABLE_DDR4_1333               @ Init DRAM parameter
> table
> > @@ -1439,18 +1363,8 @@ check_dram_size_end:
> >      ldr   r1, =ASTMMC_INIT_DATE
> >      str   r1, [r0]
> >
> > -/* Debug - UART console message */
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x2D                              @ '-'
> > -    str   r1, [r0]
> > -    str   r3, [r0]
> > -    mov   r1, #0x47                              @ 'G'
> > -    str   r1, [r0]
> > -    mov   r1, #0x62                              @ 'b'
> > -    str   r1, [r0]
> > -    mov   r1, #0x2D                              @ '-'
> > -    str   r1, [r0]
> > -/* Debug - UART console message */
> > +    mov   r0, r3
> > +    bl    debug_print_dram_size
> >
> >      /* Enable DRAM Cache */
> >      ldr   r0, =0x1e6e0004
> > @@ -1520,26 +1434,8 @@ ddr_wait_engine_idle_1:
> >      b     set_scratch                            @ CBRTest() return(1)
> >
> >  ddr_test_fail:
> > -/* Debug - UART console message */
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x46                              @ 'F'
> > -    str   r1, [r0]
> > -    mov   r1, #0x61                              @ 'a'
> > -    str   r1, [r0]
> > -    mov   r1, #0x69                              @ 'i'
> > -    str   r1, [r0]
> > -    mov   r1, #0x6C                              @ 'l'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0D                              @ '\r'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0A                              @ '\n'
> > -    str   r1, [r0]
> > -    ldr   r0, =0x1e784014
> > -wait_print_0:
> > -    ldr   r1, [r0]
> > -    tst   r1, #0x40
> > -    beq   wait_print_0
> > -/* Debug - UART console message */
> > +    mov   r0, #0
> > +    bl    debug_print_ddr_status
> >      b     reset_mmc
> >
> >  set_scratch:
> > @@ -1549,21 +1445,8 @@ set_scratch:
> >      orr   r1, r1, #0x41
> >      str   r1, [r0]
> >
> > -/* Debug - UART console message */
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x44                              @ 'D'
> > -    str   r1, [r0]
> > -    mov   r1, #0x6F                              @ 'o'
> > -    str   r1, [r0]
> > -    mov   r1, #0x6E                              @ 'n'
> > -    str   r1, [r0]
> > -    mov   r1, #0x65                              @ 'e'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0D                              @ '\r'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0A                              @ '\n'
> > -    str   r1, [r0]
> > -/* Debug - UART console message */
> > +    mov   r0, #1
> > +    bl    debug_print_ddr_status
> >
> >      /* Enable VGA display */
> >      ldr   r0, =0x1e6e202c
> > @@ -1571,184 +1454,10 @@ set_scratch:
> >      bic   r1, r1, #0x40
> >      str   r1, [r0]
> >
> > -/* Debug - UART console message */
> > -   /* Print PHY timing information */
> > -    ldr   r0, =0x1e784014
> > -wait_print_1:
> > -    ldr   r1, [r0]
> > -    tst   r1, #0x40
> > -    beq   wait_print_1
> > -
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x52                              @ 'R'
> > -    str   r1, [r0]
> > -    mov   r1, #0x65                              @ 'e'
> > -    str   r1, [r0]
> > -    mov   r1, #0x61                              @ 'a'
> > -    str   r1, [r0]
> > -    mov   r1, #0x64                              @ 'd'
> > -    str   r1, [r0]
> > -    mov   r1, #0x20                              @ ' '
> > -    str   r1, [r0]
> > -    mov   r1, #0x6D                              @ 'm'
> > -    str   r1, [r0]
> > -    mov   r1, #0x61                              @ 'a'
> > -    str   r1, [r0]
> > -    mov   r1, #0x72                              @ 'r'
> > -    str   r1, [r0]
> > -    mov   r1, #0x67                              @ 'g'
> > -    str   r1, [r0]
> > -    mov   r1, #0x69                              @ 'i'
> > -    str   r1, [r0]
> > -    mov   r1, #0x6E                              @ 'n'
> > -    str   r1, [r0]
> > -    mov   r1, #0x2D                              @ '-'
> > -    str   r1, [r0]
> > -    mov   r1, #0x44                              @ 'D'
> > -    str   r1, [r0]
> > -    mov   r1, #0x4C                              @ 'L'
> > -    str   r1, [r0]
> > -    mov   r1, #0x3A                              @ ':'
> > -    str   r1, [r0]
> > -
> > -    ldr   r0, =0x1e784014
> > -wait_print_2:
> > -    ldr   r1, [r0]
> > -    tst   r1, #0x40
> > -    beq   wait_print_2
> > -
> > -    ldr   r7, =0x000001FE                        @ divide by 510
> > -    mov   r8, #10                                @ multiply by 10
> > -print_DQL_eye_margin:
> > -    ldr   r0, =0x1e6e03d0
> > -    ldr   r2, [r0]
> > -    and   r2, r2, #0xFF
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x30                              @ '0'
> > -    str   r1, [r0]
> > -    mov   r1, #0x2E                              @ '.'
> > -    str   r1, [r0]
> > -    mov   r3, #0x4                               @ print 4 digits
> > -print_DQL_div_loop:
> > -    mul   r2, r8, r2
> > -    cmp   r2, r7
> > -    blt   print_DQL_div_0
> > -    mov   r6, #0x0
> > -print_DQL_div_digit:
> > -    sub   r2, r2, r7
> > -    add   r6, r6, #0x1
> > -    cmp   r2, r7
> > -    bge   print_DQL_div_digit
> > -    b     print_DQL_div_n
> > -
> > -print_DQL_div_0:
> > -    mov   r1, #0x30                              @ '0'
> > -    str   r1, [r0]
> > -    b     print_DQL_next
> > -print_DQL_div_n:
> > -    add   r1, r6, #0x30                          @ print n
> > -    str   r1, [r0]
> > -print_DQL_next:
> > -    subs  r3, r3, #1
> > -    beq   print_DQH_eye_margin
> > -    cmp   r2, #0x0
> > -    beq   print_DQH_eye_margin
> > -    b     print_DQL_div_loop
> > -
> > -print_DQH_eye_margin:
> > -    mov   r1, #0x2F                              @ '/'
> > -    str   r1, [r0]
> > -    mov   r1, #0x44                              @ 'D'
> > -    str   r1, [r0]
> > -    mov   r1, #0x48                              @ 'H'
> > -    str   r1, [r0]
> > -    mov   r1, #0x3A                              @ ':'
> > -    str   r1, [r0]
> > -
> > -    ldr   r0, =0x1e784014
> > -wait_print_3:
> > -    ldr   r1, [r0]
> > -    tst   r1, #0x40
> > -    beq   wait_print_3
> > -
> >      ldr   r0, =0x1e6e03d0
> >      ldr   r2, [r0]
> > -    mov   r2, r2, lsr #8
> > -    and   r2, r2, #0xFF
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x30                              @ '0'
> > -    str   r1, [r0]
> > -    mov   r1, #0x2E                              @ '.'
> > -    str   r1, [r0]
> > -    mov   r3, #0x4                               @ print 4 digits
> > -print_DQH_div_loop:
> > -    mul   r2, r8, r2
> > -    cmp   r2, r7
> > -    blt   print_DQH_div_0
> > -    mov   r6, #0x0
> > -print_DQH_div_digit:
> > -    sub   r2, r2, r7
> > -    add   r6, r6, #0x1
> > -    cmp   r2, r7
> > -    bge   print_DQH_div_digit
> > -    b     print_DQH_div_n
> > -
> > -print_DQH_div_0:
> > -    mov   r1, #0x30                              @ '0'
> > -    str   r1, [r0]
> > -    b     print_DQH_next
> > -print_DQH_div_n:
> > -    add   r1, r6, #0x30                          @ print n
> > -    str   r1, [r0]
> > -print_DQH_next:
> > -    subs  r3, r3, #1
> > -    beq   print_DQ_eye_margin_last
> > -    cmp   r2, #0x0
> > -    beq   print_DQ_eye_margin_last
> > -    b     print_DQH_div_loop
> > -
> > -print_DQ_eye_margin_last:
> > -    mov   r1, #0x20                              @ ' '
> > -    str   r1, [r0]
> > -    mov   r1, #0x43                              @ 'C'
> > -    str   r1, [r0]
> > -    mov   r1, #0x4B                              @ 'K'
> > -    str   r1, [r0]
> > -
> > -    ldr   r0, =0x1e784014
> > -wait_print_4:
> > -    ldr   r1, [r0]
> > -    tst   r1, #0x40
> > -    beq   wait_print_4
> > -
> > -    ldr   r0, =0x1e784000
> > -    mov   r1, #0x20                              @ ' '
> > -    str   r1, [r0]
> > -    mov   r1, #0x28                              @ '('
> > -    str   r1, [r0]
> > -    mov   r1, #0x6D                              @ 'm'
> > -    str   r1, [r0]
> > -    mov   r1, #0x69                              @ 'i'
> > -    str   r1, [r0]
> > -    mov   r1, #0x6E                              @ 'n'
> > -    str   r1, [r0]
> > -    mov   r1, #0x3A                              @ ':'
> > -    str   r1, [r0]
> > -    mov   r1, #0x30                              @ '0'
> > -    str   r1, [r0]
> > -    mov   r1, #0x2E                              @ '.'
> > -    str   r1, [r0]
> > -    mov   r1, #0x33                              @ '3'
> > -    str   r1, [r0]
> > -    mov   r1, #0x35                              @ '5'
> > -    str   r1, [r0]
> > -    mov   r1, #0x29                              @ ')'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0D                              @ '\r'
> > -    str   r1, [r0]
> > -    mov   r1, #0x0A                              @ '\n'
> > -    str   r1, [r0]
> > -/* Debug - UART console message */
> > +    mov   r0, r2
> > +    bl    debug_print_ddr_phy_timing
> >
> >  platform_exit:
> >  #ifdef CONFIG_DRAM_ECC
> > @@ -1991,9 +1700,5 @@ set_D2PLL:
> >      ldr   r1, =0xEA
> >      str   r1, [r0]
> >
> > -    /* restore lr */
> > -    mov   lr, r4
> > -
> >      /* back to arch calling code */
> > -    mov   pc, lr
> > -
> > +    pop   {pc}
> > --
> > 2.8.0.rc3.226.g39d4020
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>



-- 
*M*axim *S*loyko

--001a1147fa52abd9fa053c16b004
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, the new patch is in separate message, I&#39;m still=
 trying to figure out how this process works.<br><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Wed, Sep 7, 2016 at 5:30 PM, Joel Stanle=
y <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank"=
>joel@jms.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hel=
lo Maxim,<br>
<span class=3D""><br>
On Sat, Sep 3, 2016 at 3:28 AM,=C2=A0 &lt;<a href=3D"mailto:maxims@google.c=
om">maxims@google.com</a>&gt; wrote:<br>
&gt; From: Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">maxims@goo=
gle.com</a>&gt;<br>
&gt;<br>
&gt; Set up a stack in SRAM at the beginning of lowlevel_init, which makes =
it<br>
&gt; possible to call non-trivial C functions, as well as put diagnostic<br=
>
&gt; strings themselves onto the stack.<br>
<br>
</span>Thanks for the patch. I am happy to see efforts to tame platform.S<b=
r>
into something we can maintain and upstream. Do you plan on continuing<br>
this cleanup?<br></blockquote><div><br></div><div>Time-permitting, yes. I&#=
39;m trying to move all of this to Driver Model with device tree, which I t=
hink will make most of platform.S obsolete. No promises yet though.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<br>
A bigger picture question: is there a good reason to retain these<br>
messages at boot? I don&#39;t think they provide any use for developers.<br=
>
They might be useful at bring up though. What are your thoughts?<br></block=
quote><div><br></div><div>They are somewhat useful to me at the moment, yes=
.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt;<br>
&gt; Several one-char writes to debug uart still remain in platform.S, I<br=
>
&gt; figured it&#39;s not worth it to make a separate call to c function fo=
r each<br>
&gt; of those.<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/include/asm/arch-<wbr>aspeed/ast_uart.h | 142 +++++++++=
++<br>
&gt;=C2=A0 arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h |=C2=A0 =C2=A04=
 +-<br>
&gt;=C2=A0 arch/arm/mach-aspeed/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 arch/arm/mach-aspeed/ast_uart.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 38 +++<br>
&gt;=C2=A0 board/aspeed/ast-g5/ast-g5.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 110 ++++++++-<br>
&gt;=C2=A0 board/aspeed/ast-g5/platform.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 351 +++-------------------------<br>
&gt;=C2=A0 6 files changed, 318 insertions(+), 329 deletions(-)<br>
&gt;=C2=A0 create mode 100644 arch/arm/include/asm/arch-<wbr>aspeed/ast_uar=
t.h<br>
&gt;=C2=A0 create mode 100644 arch/arm/mach-aspeed/ast_uart.<wbr>c<br>
&gt;<br>
&gt; diff --git a/arch/arm/include/asm/arch-<wbr>aspeed/ast_uart.h b/arch/a=
rm/include/asm/arch-<wbr>aspeed/ast_uart.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..ddf1a14<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm/include/asm/arch-<wbr>aspeed/ast_uart.h<br>
&gt; @@ -0,0 +1,142 @@<br>
&gt; +/****************************<wbr>******************************<wbr>=
*********************<br>
&gt; + * Copyright (C) 2016 Google Inc<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or<br>
&gt; + * modify it under the terms of the GNU General Public License as<br>
&gt; + * published by the Free Software Foundation; either version 2 of the=
<br>
&gt; + * License, or (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful, bu=
t<br>
&gt; + * WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU<b=
r>
&gt; + * General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program; if not, write to the Free Software<br>
&gt; + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-130=
7<br>
&gt; + * USA<br>
&gt; + ******************************<wbr>******************************<wb=
r>******************/<br>
<br>
</div></div>Drop the ascii art.<br>
<br>
u-boot uses the=C2=A0 SPDX-License-Identifier tags. See<br>
<a href=3D"http://www.denx.de/wiki/U-Boot/Licensing" rel=3D"noreferrer" tar=
get=3D"_blank">http://www.denx.de/wiki/U-<wbr>Boot/Licensing</a><br>
<div><div class=3D"h5"><br></div></div></blockquote><div><br></div><div>Fix=
ed.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div cl=
ass=3D"h5">
&gt; +<br>
&gt; +#ifndef __AST_UART_H<br>
&gt; +#define __AST_UART_H<br>
&gt; +<br>
&gt; +#include &lt;asm/io.h&gt;<br>
&gt; +<br>
&gt; +#define AST_UART_RBR(uart)=C2=A0 =C2=A0 =C2=A0 (uart)<br>
&gt; +#define AST_UART_THR(uart)=C2=A0 =C2=A0 =C2=A0 (uart)<br>
&gt; +#define AST_UART_IER(uart)=C2=A0 =C2=A0 =C2=A0 ((uart) + 0x4)<br>
&gt; +#define AST_UART_IIR(uart)=C2=A0 =C2=A0 =C2=A0 ((uart) + 0x8)<br>
&gt; +#define AST_UART_FCR(uart)=C2=A0 =C2=A0 =C2=A0 ((uart) + 0x8)<br>
&gt; +#define AST_UART_LCR(uart)=C2=A0 =C2=A0 =C2=A0 ((uart) + 0xc)<br>
&gt; +#define AST_UART_MCR(uart)=C2=A0 =C2=A0 =C2=A0 ((uart) + 0x10)<br>
&gt; +#define AST_UART_LSR(uart)=C2=A0 =C2=A0 =C2=A0 ((uart) + 0x14)<br>
&gt; +#define AST_UART_MSR(uart)=C2=A0 =C2=A0 =C2=A0 ((uart) + 0x18)<br>
&gt; +#define AST_UART_SCR(uart)=C2=A0 =C2=A0 =C2=A0 ((uart) + 0x1c)<br>
&gt; +<br>
&gt; +/* These registers can only be written when DLAB =3D 1*/<br>
&gt; +#define AST_UART_DLL(uart)=C2=A0 =C2=A0 =C2=A0 ((uart))<br>
&gt; +#define AST_UART_DLH(uart)=C2=A0 =C2=A0 =C2=A0 ((uart) + 0x4)<br>
&gt; +<br>
&gt; +/* Registers&#39; contents */<br>
&gt; +<br>
&gt; +#define AST_UART_IER_THRE=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7)<br=
>
&gt; +#define AST_UART_IER_EDSSI=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 3)<br>
&gt; +#define AST_UART_IER_ELSI=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<br=
>
&gt; +#define AST_UART_IER_ETBEI=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 1)<br>
&gt; +#define AST_UART_IER_ERBFI=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br>
&gt; +<br>
&gt; +/* AND this mask with AST_UART_IIR to find out if FIFOs are enabled. =
*/<br>
&gt; +#define AST_UART_IIR_FEN_MASK=C2=A0 =C2=A0(3 &lt;&lt; 6)<br>
&gt; +<br>
&gt; +/* Bit0 =3D=3D 0 means that the interrupt is pending, bits 3:1 identi=
fy<br>
&gt; + * interrupt.=C2=A0 These values are defined so that IIR | 0xf would =
give you the<br>
&gt; + * value for the interrupt. */<br>
&gt; +#define AST_UART_IIR_MSC=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0)<br>
&gt; +#define AST_UART_IIR_THRE=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 1)<br=
>
&gt; +#define AST_UART_IIR_RDA=C2=A0 =C2=A0 =C2=A0 =C2=A0 (2 &lt;&lt; 1)<br=
>
&gt; +#define AST_UART_IIR_RS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(3 &lt;&lt; =
1)<br>
&gt; +#define AST_UART_IIR_CTO=C2=A0 =C2=A0 =C2=A0 =C2=A0 (6 &lt;&lt; 1)<br=
>
&gt; +<br>
&gt; +/* RX FIFO Interrupt trigger level */<br>
&gt; +#define AST_UART_FCR_RXFITL_MASK=C2=A0 =C2=A0 (3 &lt;&lt; 6)<br>
&gt; +/* One byte received */<br>
&gt; +#define AST_UART_FCR_RXFITL1=C2=A0 =C2=A0 (0)<br>
&gt; +/* 4 bytes received */<br>
&gt; +#define AST_UART_FCR_RXFITL4=C2=A0 =C2=A0 (1 &lt;&lt; 6)<br>
&gt; +/* 8 bytes received */<br>
&gt; +#define AST_UART_FCR_RXFITL8=C2=A0 =C2=A0 (2 &lt;&lt; 6)<br>
&gt; +/* 14 bytes received */<br>
&gt; +#define AST_UART_FCR_RXFITL14=C2=A0 =C2=A0(3 &lt;&lt; 6)<br>
&gt; +<br>
&gt; +/* TX FIFO Interrupt trigger level */<br>
&gt; +#define AST_UART_FCR_TXFITL_MASK=C2=A0 =C2=A0 (3 &lt;&lt; 4)<br>
&gt; +/* FIFO Empty (0 bytes in FIFO) */<br>
&gt; +#define AST_UART_FCR_TXFITL0=C2=A0 =C2=A0 (0)<br>
&gt; +/* 2 bytes in FIFO */<br>
&gt; +#define AST_UART_FCR_TXFITL2=C2=A0 =C2=A0 (1 &lt;&lt; 4)<br>
&gt; +/* FIFO 1/4 full (4 bytes) */<br>
&gt; +#define AST_UART_FCR_TXFITLQ=C2=A0 =C2=A0 (2 &lt;&lt; 4)<br>
&gt; +/* FIFO 1/2 full (8 bytes) */<br>
&gt; +#define AST_UART_FCR_TXFITLH=C2=A0 =C2=A0 (3 &lt;&lt; 4)<br>
&gt; +<br>
&gt; +#define AST_UART_FCR_TXFRST=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<br>
&gt; +#define AST_UART_FCR_RXFRST=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 1)<br>
&gt; +#define AST_UART_FCR_FEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br=
>
&gt; +<br>
&gt; +#define AST_UART_LCR_DLAB=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7)<br=
>
&gt; +#define AST_UART_LCR_BC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; =
6)<br>
&gt; +#define AST_UART_LCR_EPS=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 4)<br=
>
&gt; +#define AST_UART_LCR_PEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 3)<br=
>
&gt; +#define AST_UART_LCR_STOP=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<br=
>
&gt; +<br>
&gt; +/* Number of bits per character */<br>
&gt; +#define AST_UART_LCR_BPC_MASK=C2=A0 =C2=A0(3)<br>
&gt; +#define AST_UART_LCR_BPC5=C2=A0 =C2=A0 =C2=A0 =C2=A0(0)<br>
&gt; +#define AST_UART_LCR_BPC6=C2=A0 =C2=A0 =C2=A0 =C2=A0(1)<br>
&gt; +#define AST_UART_LCR_BPC7=C2=A0 =C2=A0 =C2=A0 =C2=A0(2)<br>
&gt; +#define AST_UART_LCR_BPC8=C2=A0 =C2=A0 =C2=A0 =C2=A0(3)<br>
&gt; +<br>
&gt; +#define AST_UART_MCR_LB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; =
4)<br>
&gt; +#define AST_UART_MCR_OUT2=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 3)<br=
>
&gt; +#define AST_UART_MCR_OUT1=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<br=
>
&gt; +#define AST_UART_MCR_RTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 1)<br=
>
&gt; +#define AST_UART_MCR_DTR=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br=
>
&gt; +<br>
&gt; +#define AST_UART_LSR_ERXF=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7)<br=
>
&gt; +#define AST_UART_LSR_TEMPTY=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 6)<br>
&gt; +#define AST_UART_LSR_THRE=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 5)<br=
>
&gt; +#define AST_UART_LSR_BI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; =
4)<br>
&gt; +#define AST_UART_LSR_FE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; =
3)<br>
&gt; +#define AST_UART_LSR_PE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; =
2)<br>
&gt; +#define AST_UART_LSR_OE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; =
1)<br>
&gt; +#define AST_UART_LSR_DR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; =
0)<br>
&gt; +<br>
&gt; +#define AST_UART_MSR_NDCD_OUT2=C2=A0 (1 &lt;&lt; 7)<br>
&gt; +#define AST_UART_MSR_NRI_OUT1=C2=A0 =C2=A0(1 &lt;&lt; 6)<br>
&gt; +#define AST_UART_MSR_NDSR_NDTR=C2=A0 (1 &lt;&lt; 5)<br>
&gt; +#define AST_UART_MSR_NCTS_NRTS=C2=A0 (1 &lt;&lt; 4)<br>
&gt; +#define AST_UART_MSR_DDCD=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 3)<br=
>
&gt; +#define AST_UART_MSR_TERI=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<br=
>
&gt; +#define AST_UART_MSR_DDSR=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 1)<br=
>
&gt; +#define AST_UART_MSR_DCTS=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br=
>
&gt; +<br>
&gt; +#define AST_UART_FIFO_SIZE=C2=A0 =C2=A0 =C2=A0 (16)<br>
&gt; +<br>
&gt; +#define ast_uart_wait_txempty(uart) while(!(readl(AST_UART_LSR((<wbr>=
uart))) &amp; AST_UART_LSR_TEMPTY))<br>
&gt; +#define ast_uart_write(uart, c)=C2=A0 =C2=A0 =C2=A0writel((c), AST_UA=
RT_THR((uart)))<br>
&gt; +#define ast_uart_enable_fifo(uart)=C2=A0 setbits_le32(AST_UART_FCR((<=
wbr>uart)), AST_UART_FCR_FEN)<br>
&gt; +#define ast_uart_enable_thre_mode(<wbr>uart) setbits_le32(AST_UART_IE=
R(<wbr>uart), AST_UART_IER_THRE)<br>
<br>
</div></div>Why not functions for these?<br></blockquote><div><br></div><di=
v>Just to avoid function call overhead. They look simple enough.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +/* In THRE and FIFO mode, wait until there is some space in FIFO */<b=
r>
&gt; +#define ast_uart_wait_fifo_ready(uart) while((readl(AST_UART_LSR(<wbr=
>uart)) &amp; AST_UART_LSR_THRE))<br>
&gt; +<br>
&gt; +#define ast_uart_set_bpc(uart, bpc) clrsetbits_le32(AST_UART_LCR((<wb=
r>uart)), AST_UART_LCR_BPC_MASK, (bpc))<br>
&gt; +<br>
&gt; +#define ast_uart_unlock_dlab(uart) setbits_le32(AST_UART_LCR((<wbr>ua=
rt)), AST_UART_LCR_DLAB)<br>
&gt; +#define ast_uart_lock_dlab(uart) clrbits_le32(AST_UART_LCR(<wbr>uart)=
, AST_UART_LCR_DLAB)<br>
&gt; +<br>
&gt; +/* NOTE: These write functions only work when THRE mode and FIFOs are=
 enabled. */<br>
&gt; +void ast_uart_write_buffer_sync(<wbr>uint32_t uart, const uint8_t* bu=
ffer, uint16_t len);<br>
&gt; +void ast_uart_write_string_sync(<wbr>uint32_t uart, const char* s);<b=
r>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h b/arch/a=
rm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
&gt; index b89df82..b714fa9 100644<br>
&gt; --- a/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
&gt; +++ b/arch/arm/include/asm/arch-<wbr>aspeed/regs-scu.h<br>
&gt; @@ -10,8 +10,8 @@<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 1. 2012/12/29 Ryan Chen Create<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 ******************************<wbr>*****************************=
*<wbr>********************/<br>
&gt; -#ifndef __AST_SCU_H<br>
&gt; -#define __AST_SCU_H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt; +#ifndef __AST_REGS_SCU_H<br>
&gt; +#define __AST_REGS_SCU_H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt;<br>
&gt;=C2=A0 #include &lt;asm/arch/aspeed.h&gt;<br>
&gt;<br>
&gt; diff --git a/arch/arm/mach-aspeed/<wbr>Makefile b/arch/arm/mach-aspeed=
/<wbr>Makefile<br>
&gt; index d72f62a..3e0b4f7 100644<br>
&gt; --- a/arch/arm/mach-aspeed/<wbr>Makefile<br>
&gt; +++ b/arch/arm/mach-aspeed/<wbr>Makefile<br>
&gt; @@ -11,5 +11,5 @@<br>
&gt;=C2=A0 #<br>
&gt;<br>
&gt;<br>
&gt; -obj-y +=3D timer.o reset.o cpuinfo.o ast-scu.o ast-ahbc.o ast-sdmc.o<=
br>
&gt; +obj-y +=3D timer.o reset.o cpuinfo.o ast-scu.o ast-ahbc.o ast-sdmc.o =
ast_uart.o<br>
&gt;=C2=A0 obj-$(CONFIG_AST_SPI_NOR) +=3D flash.o<br>
&gt; diff --git a/arch/arm/mach-aspeed/ast_<wbr>uart.c b/arch/arm/mach-aspe=
ed/ast_<wbr>uart.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..1226827<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm/mach-aspeed/ast_<wbr>uart.c<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +/****************************<wbr>******************************<wbr>=
*********************<br>
&gt; + * Copyright (C) 2016 Google Inc<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or<br>
&gt; + * modify it under the terms of the GNU General Public License as<br>
&gt; + * published by the Free Software Foundation; either version 2 of the=
<br>
&gt; + * License, or (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful, bu=
t<br>
&gt; + * WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU<b=
r>
&gt; + * General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program; if not, write to the Free Software<br>
&gt; + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-130=
7<br>
&gt; + * USA<br>
&gt; + ******************************<wbr>******************************<wb=
r>******************/<br>
<br>
</div></div>Fix the header.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +#include &lt;asm/io.h&gt;<br>
&gt; +#include &lt;asm/arch/ast_uart.h&gt;<br>
&gt; +<br>
&gt; +void ast_uart_write_buffer_sync(<wbr>uint32_t uart, const uint8_t *bu=
ffer,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (; len; --len, ++buffer) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_uart_wait_=
fifo_ready(uart)<wbr>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_uart_write=
(uart, *buffer);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +void ast_uart_write_string_sync(<wbr>uint32_t uart, const char *s)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (; *s; ++s) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_uart_wait_=
fifo_ready(uart)<wbr>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_uart_write=
(uart, *s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
<br>
</span>Is there any way we could reuse common string/serial code from u-boo=
t?<br></blockquote><div><br></div><div>Maybe, I have no experience with tha=
t. Making this fully compatible with console or serial is somewhat out of s=
cope of what I&#39;m trying to do here.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<span class=3D""><br>
&gt; diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5=
.c<br>
&gt; index 81ea88a..b0b8535 100644<br>
&gt; --- a/board/aspeed/ast-g5/ast-g5.c<br>
&gt; +++ b/board/aspeed/ast-g5/ast-g5.c<br>
&gt; @@ -35,16 +35,21 @@<br>
&gt;<br>
&gt;=C2=A0 #include &lt;common.h&gt;<br>
&gt;=C2=A0 #include &lt;netdev.h&gt;<br>
&gt; -#include &lt;asm/arch/ast_scu.h&gt;<br>
&gt; +#include &lt;asm/arch/ast_g5_platform.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/arch/ast-sdmc.h&gt;<br>
&gt; +#include &lt;asm/arch/ast_scu.h&gt;<br>
&gt; +#include &lt;asm/arch/ast_uart.h&gt;<br>
&gt; +#include &lt;asm/arch/regs-scu.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/io.h&gt;<br>
&gt;<br>
&gt; +#define AST_DEBUG_UART=C2=A0 =C2=A0 =C2=A0 (0x1e784000)<br>
&gt; +<br>
&gt;=C2=A0 DECLARE_GLOBAL_DATA_PTR;<br>
&gt;<br>
&gt;=C2=A0 #if defined(CONFIG_SHOW_BOOT_<wbr>PROGRESS)<br>
&gt;=C2=A0 void show_boot_progress(int progress)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 printf(&quot;Boot reached stage %d\n&quot;, progress);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Boot reached stage %d\n&quot;=
, progress);<br>
<br>
</span>This appears unrelated to your changes.<br></blockquote><div><br></d=
iv><div>I&#39;ll send automatic style fixes in a separate patch.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt; @@ -66,9 +71,108 @@ int dram_init(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +/* assumes digit &lt; 16 */<br>
&gt; +static inline char hex_digit(uint8_t digit)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (digit &lt; 10) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;0&=
#39; + digit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;a&=
#39; + (digit - 10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void format_u8_hex(char *dst, uint8_t value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*dst =3D hex_digit(value &gt;&gt; 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*(dst + 1) =3D hex_digit(value &amp; 0xf);=
<br>
&gt; +}<br>
<br>
</span>These are common printf formatting. Can we use them from another par=
t of u-boot?<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +static inline void debug_uart_print(const char *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_uart_write_string_sync(<wbr>AST_DEBUG_=
UART, s);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void debug_print_ddr_version(uint8_<wbr>t version)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char message[8] =3D &quot;-DDR_\r\n&quot;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0message[4] =3D &#39;0&#39; + version;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0debug_uart_print(message);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void debug_print_dram_init_message(<wbr>uint8_t version)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char message[16] =3D &quot;\r\nDRAM Init-V=
__&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char *version_dst =3D message + 13;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0format_u8_hex(version_dst, version);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0debug_uart_print(message);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void debug_print_dram_size(char size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char message[6] =3D &quot;-_Gb-&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0message[1] =3D size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0debug_uart_print(message);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void debug_print_ddr_status(bool done)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (done) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug_uart_pri=
nt(&quot;Done\r\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug_uart_pri=
nt(&quot;Fail\r\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void format_phy_timing(char *dst, uint8_t value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This is adopted from platforms.S file b=
y Aspeed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * They read memory address (which is not =
mentioned in the data sheet)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and then divide byte value by 510 and p=
rint 4 digits after the dot.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t timing_value =3D value * 1000 / 5=
1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (int index =3D 3; index &gt;=3D 0 &amp=
;&amp; timing_value &gt; 0; --index) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t digit =
=3D timing_value % 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timing_value /=
=3D 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst[index] =3D=
 &#39;0&#39; + digit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +void debug_print_ddr_phy_timing(<wbr>uint16_t margin)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char message[46] =3D &quot;Read margin DL:=
0.0000/0.0000 CK (min: 0.35)\r\n&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0format_phy_timing(message + 17, margin &am=
p; 0xff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0format_phy_timing(message + 24, (margin &g=
t;&gt; 8) &amp; 0xff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0debug_uart_print(message);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void init_uart_for_debug(uint32_t uart_base)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_uart_set_bpc(uart_base, AST_UART_LCR_B=
PC8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_uart_unlock_dlab(uart_<wbr>base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t uart_clk_mul =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl(AST_SCU_BASE + AST_SCU=
_MISC1_CTRL) &amp; (1 &lt;&lt; 12) ? 1 : 13;<br>
&gt; +#ifdef CONFIG_DRAM_UART_38400<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t br_base =3D 3 * uart_clk_mu=
l;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t br_base =3D 1 * uart_clk_mu=
l;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(br_base, AST_UART_DLL(uart_base));<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(0, AST_UART_DLH(uart_base));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Lock DLAB */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_uart_lock_dlab(uart_base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_uart_enable_fifo(uart_<wbr>base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_uart_enable_thre_mode(<wbr>uart_base);=
<br>
&gt; +}<br>
&gt; +<br>
&gt; +void init_debug_uart(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init_uart_for_debug(AST_DEBUG_<wbr>UART);<=
br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 #ifdef CONFIG_CMD_NET<br>
&gt;=C2=A0 int board_eth_init(bd_t *bd)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ftgmac100_initialize(bd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ftgmac100_initialize(bd);<br>
<br>
</div></div>Unrelated change.<br>
<span class=3D""><br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/board/aspeed/ast-g5/<wbr>platform.S b/board/aspeed/ast-g5=
/<wbr>platform.S<br>
&gt; index c810f44..a33afee 100644<br>
&gt; --- a/board/aspeed/ast-g5/<wbr>platform.S<br>
&gt; +++ b/board/aspeed/ast-g5/<wbr>platform.S<br>
&gt; @@ -78,7 +78,6 @@<br>
&gt;=C2=A0 #include &lt;version.h&gt;<br>
&gt;<br>
&gt;=C2=A0 /*****************************<wbr>*****************************=
*<wbr>*******************<br>
&gt; -=C2=A0 r4 : return program counter<br>
<br>
</span>??<br></blockquote><div><br></div><div>r4 is no longer used in this =
code.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt;=C2=A0 =C2=A0 r5 : DDR speed timing table base address<br>
&gt;=C2=A0 =C2=A0 Free registers:<br>
&gt;=C2=A0 =C2=A0 r0, r1, r2, r3, r6, r7, r8, r9, r10, r11<br>
&gt; @@ -104,6 +103,9 @@<br>
&gt;=C2=A0 #define ASTMMC_REGIDX_RFC=C2=A0 =C2=A0 0x3C<br>
&gt;=C2=A0 #define ASTMMC_REGIDX_PLL=C2=A0 =C2=A0 0x40<br>
&gt;<br>
&gt; +#define AST_SRAM_END=C2=A0 0x1e728ffc<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 TIME_TABLE_DDR3_1333:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .word=C2=A0 =C2=A00x53503C37=C2=A0 =C2=A0 =C2=A0 =
=C2=A0@ 0x010<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .word=C2=A0 =C2=A00xF858D47F=C2=A0 =C2=A0 =C2=A0 =
=C2=A0@ 0x014<br>
&gt; @@ -242,12 +244,20 @@ TIME_TABLE_DDR4_1600:<br>
&gt;=C2=A0 =C2=A0Calibration Macro End<br>
&gt;=C2=A0 =C2=A0******************************<wbr>***********************=
*******<wbr>******************/<br>
&gt;<br>
&gt; +.globl debug_print_dram_init_message<br>
&gt; +.globl debug_print_ddr_version<br>
&gt; +.globl debug_print_dram_size<br>
&gt; +.globl debug_print_ddr_status<br>
&gt; +.globl debug_print_ddr_phy_timing<br>
&gt; +.globl init_debug_uart<br>
&gt;=C2=A0 .globl lowlevel_init<br>
&gt;=C2=A0 lowlevel_init:<br>
&gt;<br>
&gt;=C2=A0 init_dram:<br>
&gt; +=C2=A0 =C2=A0 /* Setup a stack in SRAM */<br>
&gt; +=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0sp, =3DAST_SRAM_END<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* save lr */<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r4, lr<br>
&gt; +=C2=A0 =C2=A0 push=C2=A0 {lr}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Clear AHB bus lock condition */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e600000<br>
&gt; @@ -489,82 +499,10 @@ wait_mmc_reset_done:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r1, =3D0x00020000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt;<br>
&gt; -/* Debug - UART console message */<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e78400c<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x83<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e6e202c<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r2, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r2, r2, lsr #12<br>
&gt; -=C2=A0 =C2=A0 tst=C2=A0 =C2=A0r2, #0x01<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 moveq r1, #0x0D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ Baudra=
te 115200<br>
&gt; -=C2=A0 =C2=A0 movne r1, #0x01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ Baudra=
te 115200, div13<br>
&gt; -#ifdef CONFIG_DRAM_UART_38400<br>
&gt; -=C2=A0 =C2=A0 moveq r1, #0x27=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ Baudra=
te 38400<br>
&gt; -=C2=A0 =C2=A0 movne r1, #0x03=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ Baudra=
te 38400 , div13<br>
&gt; -#endif<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784004<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x00<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e78400c<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x03<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784008<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x07<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; +=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 init_debug_uart<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\r&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\n&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x44=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;D&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x52=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;R&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x41=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;A&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x4D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;M&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x20=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39; &#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x49=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;I&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x6E=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;n&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x69=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;i&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x74=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;t&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x2D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;-&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x56=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;V&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #ASTMMC_INIT_VER<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, r1, lsr #4<br>
&gt; -=C2=A0 =C2=A0 print_hex_char<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #ASTMMC_INIT_VER<br>
&gt; -=C2=A0 =C2=A0 print_hex_char<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x2D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;-&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784014<br>
&gt; -wait_print:<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 tst=C2=A0 =C2=A0r1, #0x40<br>
&gt; -=C2=A0 =C2=A0 beq=C2=A0 =C2=A0wait_print<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x44=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;D&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x44=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;D&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x52=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;R&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; +=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r0, #ASTMMC_INIT_VER<br>
&gt; +=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 debug_print_dram_init_message<br>
&gt;=C2=A0 /* Debug - UART console message */<br>
&gt;<br>
&gt;=C2=A0 /*****************************<wbr>*****************************=
*<wbr>*******************<br>
&gt; @@ -647,15 +585,8 @@ wait_print:<br>
&gt;=C2=A0 =C2=A0DDR3 Init<br>
&gt;=C2=A0 =C2=A0******************************<wbr>***********************=
*******<wbr>******************/<br>
&gt;=C2=A0 ddr3_init:<br>
&gt; -/* Debug - UART console message */<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x33=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;3&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\r&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\n&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -/* Debug - UART console message */<br>
&gt; +=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r0, #3<br>
&gt; +=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 debug_print_ddr_version<br>
&gt;<br>
&gt;=C2=A0 #if=C2=A0 =C2=A0defined (CONFIG_DRAM_1333)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 adrl=C2=A0 r5, TIME_TABLE_DDR3_1333=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ Init DRAM parameter table<br>
&gt; @@ -865,15 +796,8 @@ ddr3_check_dllrdy:<br>
&gt;=C2=A0 =C2=A0DDR4 Init<br>
&gt;=C2=A0 =C2=A0******************************<wbr>***********************=
*******<wbr>******************/<br>
&gt;=C2=A0 ddr4_init:<br>
&gt; -/* Debug - UART console message */<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x34=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;4&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\r&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\n&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -/* Debug - UART console message */<br>
&gt; +=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r0, #4<br>
&gt; +=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 debug_print_ddr_version<br>
&gt;<br>
&gt;=C2=A0 #if=C2=A0 =C2=A0defined (CONFIG_DRAM_1333)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 adrl=C2=A0 r5, TIME_TABLE_DDR4_1333=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ Init DRAM parameter table<br>
&gt; @@ -1439,18 +1363,8 @@ check_dram_size_end:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r1, =3DASTMMC_INIT_DATE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt;<br>
&gt; -/* Debug - UART console message */<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x2D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;-&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r3, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x47=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;G&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x62=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;b&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x2D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;-&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -/* Debug - UART console message */<br>
&gt; +=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r0, r3<br>
&gt; +=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 debug_print_dram_size<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Enable DRAM Cache */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e6e0004<br>
&gt; @@ -1520,26 +1434,8 @@ ddr_wait_engine_idle_1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0set_scratch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 @ CBRTest() return(1)<br>
&gt;<br>
&gt;=C2=A0 ddr_test_fail:<br>
&gt; -/* Debug - UART console message */<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x46=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;F&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x61=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;a&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x69=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;i&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x6C=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;l&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\r&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\n&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784014<br>
&gt; -wait_print_0:<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 tst=C2=A0 =C2=A0r1, #0x40<br>
&gt; -=C2=A0 =C2=A0 beq=C2=A0 =C2=A0wait_print_0<br>
&gt; -/* Debug - UART console message */<br>
&gt; +=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r0, #0<br>
&gt; +=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 debug_print_ddr_status<br>
&gt;=C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0reset_mmc<br>
&gt;<br>
&gt;=C2=A0 set_scratch:<br>
&gt; @@ -1549,21 +1445,8 @@ set_scratch:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 orr=C2=A0 =C2=A0r1, r1, #0x41<br>
&gt;=C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt;<br>
&gt; -/* Debug - UART console message */<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x44=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;D&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x6F=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;o&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x6E=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;n&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x65=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;e&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\r&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\n&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -/* Debug - UART console message */<br>
&gt; +=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r0, #1<br>
&gt; +=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 debug_print_ddr_status<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Enable VGA display */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e6e202c<br>
&gt; @@ -1571,184 +1454,10 @@ set_scratch:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bic=C2=A0 =C2=A0r1, r1, #0x40<br>
&gt;=C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt;<br>
&gt; -/* Debug - UART console message */<br>
&gt; -=C2=A0 =C2=A0/* Print PHY timing information */<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784014<br>
&gt; -wait_print_1:<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 tst=C2=A0 =C2=A0r1, #0x40<br>
&gt; -=C2=A0 =C2=A0 beq=C2=A0 =C2=A0wait_print_1<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x52=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;R&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x65=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;e&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x61=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;a&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;d&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x20=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39; &#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x6D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;m&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x61=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;a&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;r&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x67=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;g&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x69=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;i&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x6E=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;n&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x2D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;-&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x44=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;D&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x4C=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;L&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x3A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;:&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784014<br>
&gt; -wait_print_2:<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 tst=C2=A0 =C2=A0r1, #0x40<br>
&gt; -=C2=A0 =C2=A0 beq=C2=A0 =C2=A0wait_print_2<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r7, =3D0x000001FE=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ divide by =
510<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r8, #10=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 @ multiply by 10<br>
&gt; -print_DQL_eye_margin:<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e6e03d0<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r2, [r0]<br>
&gt; -=C2=A0 =C2=A0 and=C2=A0 =C2=A0r2, r2, #0xFF<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x30=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;0&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x2E=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;.&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r3, #0x4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0@ print 4 digits<br>
&gt; -print_DQL_div_loop:<br>
&gt; -=C2=A0 =C2=A0 mul=C2=A0 =C2=A0r2, r8, r2<br>
&gt; -=C2=A0 =C2=A0 cmp=C2=A0 =C2=A0r2, r7<br>
&gt; -=C2=A0 =C2=A0 blt=C2=A0 =C2=A0print_DQL_div_0<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r6, #0x0<br>
&gt; -print_DQL_div_digit:<br>
&gt; -=C2=A0 =C2=A0 sub=C2=A0 =C2=A0r2, r2, r7<br>
&gt; -=C2=A0 =C2=A0 add=C2=A0 =C2=A0r6, r6, #0x1<br>
&gt; -=C2=A0 =C2=A0 cmp=C2=A0 =C2=A0r2, r7<br>
&gt; -=C2=A0 =C2=A0 bge=C2=A0 =C2=A0print_DQL_div_digit<br>
&gt; -=C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0print_DQL_div_n<br>
&gt; -<br>
&gt; -print_DQL_div_0:<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x30=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;0&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0print_DQL_next<br>
&gt; -print_DQL_div_n:<br>
&gt; -=C2=A0 =C2=A0 add=C2=A0 =C2=A0r1, r6, #0x30=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ print =
n<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -print_DQL_next:<br>
&gt; -=C2=A0 =C2=A0 subs=C2=A0 r3, r3, #1<br>
&gt; -=C2=A0 =C2=A0 beq=C2=A0 =C2=A0print_DQH_eye_margin<br>
&gt; -=C2=A0 =C2=A0 cmp=C2=A0 =C2=A0r2, #0x0<br>
&gt; -=C2=A0 =C2=A0 beq=C2=A0 =C2=A0print_DQH_eye_margin<br>
&gt; -=C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0print_DQL_div_loop<br>
&gt; -<br>
&gt; -print_DQH_eye_margin:<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x2F=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;/&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x44=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;D&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x48=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;H&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x3A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;:&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784014<br>
&gt; -wait_print_3:<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 tst=C2=A0 =C2=A0r1, #0x40<br>
&gt; -=C2=A0 =C2=A0 beq=C2=A0 =C2=A0wait_print_3<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e6e03d0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r2, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r2, r2, lsr #8<br>
&gt; -=C2=A0 =C2=A0 and=C2=A0 =C2=A0r2, r2, #0xFF<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x30=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;0&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x2E=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;.&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r3, #0x4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0@ print 4 digits<br>
&gt; -print_DQH_div_loop:<br>
&gt; -=C2=A0 =C2=A0 mul=C2=A0 =C2=A0r2, r8, r2<br>
&gt; -=C2=A0 =C2=A0 cmp=C2=A0 =C2=A0r2, r7<br>
&gt; -=C2=A0 =C2=A0 blt=C2=A0 =C2=A0print_DQH_div_0<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r6, #0x0<br>
&gt; -print_DQH_div_digit:<br>
&gt; -=C2=A0 =C2=A0 sub=C2=A0 =C2=A0r2, r2, r7<br>
&gt; -=C2=A0 =C2=A0 add=C2=A0 =C2=A0r6, r6, #0x1<br>
&gt; -=C2=A0 =C2=A0 cmp=C2=A0 =C2=A0r2, r7<br>
&gt; -=C2=A0 =C2=A0 bge=C2=A0 =C2=A0print_DQH_div_digit<br>
&gt; -=C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0print_DQH_div_n<br>
&gt; -<br>
&gt; -print_DQH_div_0:<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x30=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;0&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0print_DQH_next<br>
&gt; -print_DQH_div_n:<br>
&gt; -=C2=A0 =C2=A0 add=C2=A0 =C2=A0r1, r6, #0x30=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ print =
n<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -print_DQH_next:<br>
&gt; -=C2=A0 =C2=A0 subs=C2=A0 r3, r3, #1<br>
&gt; -=C2=A0 =C2=A0 beq=C2=A0 =C2=A0print_DQ_eye_margin_last<br>
&gt; -=C2=A0 =C2=A0 cmp=C2=A0 =C2=A0r2, #0x0<br>
&gt; -=C2=A0 =C2=A0 beq=C2=A0 =C2=A0print_DQ_eye_margin_last<br>
&gt; -=C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0print_DQH_div_loop<br>
&gt; -<br>
&gt; -print_DQ_eye_margin_last:<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x20=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39; &#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x43=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;C&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x4B=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;K&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784014<br>
&gt; -wait_print_4:<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 tst=C2=A0 =C2=A0r1, #0x40<br>
&gt; -=C2=A0 =C2=A0 beq=C2=A0 =C2=A0wait_print_4<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r0, =3D0x1e784000<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x20=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39; &#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x28=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;(&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x6D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;m&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x69=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;i&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x6E=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;n&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x3A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;:&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x30=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;0&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x2E=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;.&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x33=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;3&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x35=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;5&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x29=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;)&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\r&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r1, #0x0A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 @ &#39;\n&#39;<br>
&gt; -=C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt; -/* Debug - UART console message */<br>
&gt; +=C2=A0 =C2=A0 mov=C2=A0 =C2=A0r0, r2<br>
&gt; +=C2=A0 =C2=A0 bl=C2=A0 =C2=A0 debug_print_ddr_phy_timing<br>
&gt;<br>
&gt;=C2=A0 platform_exit:<br>
&gt;=C2=A0 #ifdef CONFIG_DRAM_ECC<br>
&gt; @@ -1991,9 +1700,5 @@ set_D2PLL:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0r1, =3D0xEA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0r1, [r0]<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* restore lr */<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0lr, r4<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* back to arch calling code */<br>
&gt; -=C2=A0 =C2=A0 mov=C2=A0 =C2=A0pc, lr<br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 pop=C2=A0 =C2=A0{pc}<br>
&gt; --<br>
&gt; 2.8.0.rc3.226.g39d4020<br>
&gt;<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</=
a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--001a1147fa52abd9fa053c16b004--
