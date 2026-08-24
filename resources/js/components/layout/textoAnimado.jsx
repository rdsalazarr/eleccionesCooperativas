import { useEffect, useState } from "react";
import { motion } from "framer-motion";

export default function TextoAnimado({ texto }) {
    const [key, setKey] = useState(0);

    useEffect(() => {
        const interval = setInterval(() => {
            setKey(prev => prev + 1);
        }, 5000);

        return () => clearInterval(interval);
    }, []);

    const letras = texto.split("");

    const contenedor = {
        hidden: { opacity: 1 },
        visible: {
            opacity: 1,
            transition: {
                staggerChildren: 0.06
            }
        }
    };

    const animacionLetra = {
        hidden: { opacity: 0, y: -40, rotate: -15 },
        visible: {
            opacity: 1,
            y: 0,
            rotate: 0,
            transition: {
                duration: 0.35,
                type: "spring",
                stiffness: 250,
                damping: 12
            }
        }
    };

    return (
        <motion.span
            key={key}
            variants={contenedor}
            initial="hidden"
            animate="visible"
            style={{ display: "inline-block"}}
        >
            {letras.map((letra, i) => (
                <motion.span
                    key={i}
                    variants={animacionLetra}
                    style={{
                        display: "inline-block",
                        whiteSpace: "pre",
                        fontWeight: '600', 
                        fontSize: '1.5em'
                    }}
                >
                    {letra === " " ? "\u00A0" : letra}
                </motion.span>
            ))}
        </motion.span>
    );
}