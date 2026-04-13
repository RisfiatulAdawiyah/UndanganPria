import { motion, useScroll, useTransform } from "framer-motion";
import { MapPin } from "lucide-react";
import { Wedding } from "@/types/wedding.types";
import FloatingParticles from "./FloatingParticles";
import { getImageUrl } from "@/lib/localAssets";
import heroImage from "@/assets/wedding-hero.jpg";

interface HeroSectionProps {
  wedding: Wedding;
}

const HeroSection = ({ wedding }: HeroSectionProps) => {
  const { scrollY } = useScroll();
  const opacity = useTransform(scrollY, [0, 300], [1, 0]);
  const scale = useTransform(scrollY, [0, 300], [1, 1.2]);

  const backgroundImage = wedding.hero_image_url 
    ? getImageUrl(wedding.hero_image_url)
    : heroImage;

  const groomFullName = wedding.groom_full_name || wedding.groom_name;
  const brideFullName = wedding.bride_full_name || wedding.bride_name;
  const venue = wedding.resepsi_venue || wedding.akad_venue || '';
  const address = wedding.resepsi_address || wedding.akad_address || '';

  return (
    <section className="relative min-h-screen flex items-center justify-center py-12 md:py-20 px-4 overflow-hidden bg-geometric-pattern bg-hexagon-ornament" style={{ '--bg-color': '#1e3a5f' } as React.CSSProperties}>
      
      {/* Floating particles effect */}
      <FloatingParticles />

      {/* Background image with parallax */}
      <motion.div 
        className="absolute inset-0 z-0"
        style={{ scale }}
      >
        <div 
          className="w-full h-full bg-cover bg-center bg-no-repeat"
          style={{ backgroundImage: `url(${backgroundImage})` }}
        />
        <div className="absolute inset-0 bg-gradient-to-b from-primary/80 via-primary/70 to-primary/90" />
      </motion.div>

      <div className="relative z-10 text-center max-w-3xl mx-auto px-4">
        <motion.p
          className="font-arabic text-lg text-accent mb-4 drop-shadow-[0_2px_8px_rgba(205,127,50,0.4)]"
          dir="rtl"
          initial={{ opacity: 0, scale: 0.8 }}
          whileInView={{ opacity: 1, scale: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8, ease: "easeOut" }}
          style={{ opacity }}
        >
          بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ
        </motion.p>

        <motion.p
          className="font-body text-xs tracking-[0.15em] uppercase text-muted-foreground mb-6 drop-shadow-sm"
          initial={{ opacity: 0, y: -20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6, delay: 0.2 }}
          style={{ opacity }}
        >
          Kami Mengundang Anda Untuk Merayakan
        </motion.p>

        <motion.h1
          className="font-display text-5xl md:text-7xl lg:text-8xl text-foreground mb-4 drop-shadow-[0_4px_12px_rgba(0,0,0,0.3)]"
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8, delay: 0.3 }}
          style={{ opacity }}
        >
          {wedding.groom_name}
        </motion.h1>

        <motion.div
          className="flex items-center justify-center gap-6 my-6"
          initial={{ opacity: 0, scaleX: 0 }}
          whileInView={{ opacity: 1, scaleX: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6, delay: 0.5 }}
          style={{ opacity }}
        >
          <span className="w-20 h-px bg-accent/60" />
          <span className="font-display text-3xl text-accent italic drop-shadow-[0_2px_8px_rgba(205,127,50,0.4)]">&</span>
          <span className="w-20 h-px bg-accent/60" />
        </motion.div>

        <motion.h1
          className="font-display text-5xl md:text-7xl lg:text-8xl text-foreground mb-8 drop-shadow-[0_4px_12px_rgba(0,0,0,0.3)]"
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8, delay: 0.4 }}
          style={{ opacity }}
        >
          {wedding.bride_name}
        </motion.h1>

        {venue && (
          <motion.div
            className="flex items-center justify-center gap-2 text-muted-foreground mb-4"
            initial={{ opacity: 0 }}
            whileInView={{ opacity: 1 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6, delay: 0.7 }}
            style={{ opacity }}
          >
            <MapPin className="w-4 h-4" />
            <p className="font-body text-sm">{venue}</p>
          </motion.div>
        )}
      </div>

      {/* Decorative bottom fade */}
      <div className="absolute bottom-0 left-0 right-0 h-32 bg-gradient-to-t from-background to-transparent z-10" />
    </section>
  );
};

export default HeroSection;